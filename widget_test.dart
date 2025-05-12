// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/to/widget-testing for
// more information about Widget testing.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:socdrawer/src/controllers/user_controller.dart';
import 'package:socdrawer/src/models/user.dart';
import 'package:socdrawer/src/views/user/login_view.dart';
import 'package:socdrawer/src/views/home/home_view.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:socdrawer/src/views/events/events_view.dart';

void main() {
  group('MyWidget', () {
    testWidgets('should display a string of text', (WidgetTester tester) async {
      // Define a Widget
      const myWidget = MaterialApp(
        home: Scaffold(
          body: Text('Hello'),
        ),
      );

      // Build myWidget and trigger a frame.
      await tester.pumpWidget(myWidget);

      // Verify myWidget shows some text
      expect(find.byType(Text), findsOneWidget);
    });
  });

  group('Login Widget Tests', () {
    testWidgets('renders Login widget correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Login()));

      // Verify that the email and password fields and login button are present
      expect(find.byType(TextField), findsNWidgets(2)); // Email and Password
      expect(find.text('Login'), findsOneWidget);
    });
  });

  group('Home Widget Tests', () {
    testWidgets('renders Home widget correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CalendarView()));

      // Verify that the calendar is present
      expect(find.byType(TableCalendar), findsOneWidget);

      // Verify that the "Events" section is present
      expect(find.text('Events:'), findsOneWidget);

      // Verify that the "View All Events" button is present
      expect(find.text('View All Events'), findsOneWidget);
    });

    testWidgets('navigates to EventsView when "View All Events" is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CalendarView()));

      // Tap the "View All Events" button
      await tester.tap(find.text('View All Events'));
      await tester.pumpAndSettle();

      // Verify navigation to EventsView
      expect(find.byType(EventsView), findsOneWidget);
    });
  });
}
