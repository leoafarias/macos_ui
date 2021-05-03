import 'package:macos_ui/macos_ui.dart';
import 'package:macos_ui/src/library.dart';

/// A macOS-style alert dialog
///
/// An alert appears when the system or an app needs to warn the user about
/// an error condition, or a potentially hazardous situation or consequence.
/// An alert is modal within an app unless it pertains to a single document or
/// window, in which case it’s displayed as a sheet.
class AlertDialog extends StatelessWidget {
  /// Creates a macOS-style alert dialog.
  ///
  /// The [actions] must not be null.
  const AlertDialog({
    Key? key,
    required this.message,
    this.informativeText,
    required this.icon,
    required this.responseButtons,
    this.helpButton,
    this.accessoryView,
    this.suppressionCheckbox,
    this.suppressionLabel,
  }) : super(key: key);

  /// A short summary of the error or condition that summoned the alert.
  /// All alerts include a message.
  ///
  /// Typically a [Text] widget.
  final Widget message;

  /// A complete description of the situation, its consequences, and ways in
  /// which users can address the situation.
  ///
  /// Informative text is optional but encouraged.
  ///
  /// Typically a [Text] widget.

  final Widget? informativeText;

  /// TODO: docs
  final Widget icon;

  /// An alert can include up to three buttons, one of which can be set as the
  /// default button, for canceling the alert or taking action.
  final List<Widget> responseButtons;

  /// If your app offers Help documentation, you can include a [HelpButton] in
  /// your alert that takes the user to the documentation.
  final HelpButton? helpButton;

  /// If your app calls for it, a custom view can be appended to an alert to
  /// provide additional information.
  final Widget? accessoryView;

  /// TODO: docs
  final Checkbox? suppressionCheckbox;

  /// TODO: docs
  ///
  /// Typically a [Text] widget.
  final Widget? suppressionLabel;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
