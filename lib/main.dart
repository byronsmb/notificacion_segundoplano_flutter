import 'package:flutter/material.dart';

import 'notification/notification.dart';

// main.dart (updated)

import 'package:workmanager/workmanager.dart';
// Asegúrate de que NotificationService esté importado

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    WidgetsFlutterBinding.ensureInitialized();
    NotificationService.init();
    NotificationService.showInstantNotification(
      "HOLA NOTICIAS",
      "This shows an instant notifications",
    );
    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);

  Workmanager().registerPeriodicTask(
    "5_minute_task",
    "simpleTask",
    frequency: Duration(minutes: 5), // Intervalo de 5 minutos
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Workmanager Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to the Workmanager Example App'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Programar la tarea en segundo plano manualmente
                  Workmanager().registerPeriodicTask(
                    "1",
                    "simpleTask",
                    frequency: Duration(minutes: 5),
                  );
                },
                child: Text('Schedule Background Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




/*
WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
NotificationService.showInstantNotification(
                    "Instant Notification",
                    "This shows an instant notifications");
 */