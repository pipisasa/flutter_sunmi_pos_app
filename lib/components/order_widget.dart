import 'package:boomerang_pos/app/data/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Theme(
      // Create a unique theme with `ThemeData`
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),
          titleSmall: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
          labelLarge: TextStyle(color: Colors.black),
          labelSmall: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(),
          child: Container(
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            width: 200,
            // constraints: BoxConstraints(maxHeight: 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/images/boomerang-total-black.svg',
                    width: 150,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  width: double.infinity,
                  child: Text(
                    '#${order.slug}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    '${order.restaurant?.name}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  'Филиал: ${order.restaurant?.address}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '${order.created_at?.toDate().year}-${order.created_at?.toDate().month}-${order.created_at?.toDate().day}  ${order.created_at?.toDate().hour}:${order.created_at?.toDate().minute}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                if (order.user?.name != null)
                  Text(
                    'Заказчик: ${order.user?.name}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                Text(
                  'Телефон: ${order.user?.phone}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),

                Text(
                  'Aдрес: \n${order.user?.address?.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 5),
                const Divider(height: 1, color: Colors.black),
                const SizedBox(height: 5),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: order.items?.values
                          .map((item) => Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Text(
                                  '- ${item.quantity} * ${item.title} (${item.price}c)',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList() ??
                      [],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  height: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                _buildTotalItem(
                  leftText: 'Итого',
                  rightText: '${order.items_price}c',
                ),

                _buildTotalItem(
                  leftText: 'Контейнеры x ${order.containersCount}',
                  rightText: '${order.totalContainersPrice}c',
                ),
                _buildTotalItem(
                  leftText: 'Доставка',
                  rightText: '${order.delivery_price}c',
                ),
                Text(
                  'Всего: ${order.total_price} cом',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                // Image.asset('assets/images/boomerang-total-black.svg'),
                //         HtmlWidget(
                //           """
                // <h1 style="margin: 0; padding: 0;">Boomerang</h1>
                // <h2 style="margin: 0; padding: 0;">Фаиза</h2>
                // """,
                //           textStyle: TextStyle(
                //             color: Colors.black,
                //             fontSize: 16,
                //             fontWeight: FontWeight.w300,
                //           ),
                //         ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildTotalItem({
    required String leftText,
    required String rightText,
    double? fontSize = 12,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            color: Colors.black,
            height: 1,
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 70),
          child: Text(
            rightText,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
