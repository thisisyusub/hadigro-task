import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../app_router.dart';

class BookingScanPage extends StatefulWidget {
  const BookingScanPage({Key? key}) : super(key: key);

  @override
  State<BookingScanPage> createState() => _BookingScanPageState();
}

class _BookingScanPageState extends State<BookingScanPage> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _qrViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return QRView(
      key: _qrKey,
      formatsAllowed: const [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: size.width * 0.8,
      ),
      onQRViewCreated: (controller) {
        _qrViewController = controller;

        _qrViewController?.scannedDataStream.listen(
          (event) {
            if (event.code != null) {
              _qrViewController?.pauseCamera();

              appRouter.push(
                context.namedLocation(
                  AppRoutes.bookingDetails,
                  queryParams: {
                    'bookingCode': event.code!,
                  },
                ),
              );
            }

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(event.code ?? 'NULL')),
              );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }
}
