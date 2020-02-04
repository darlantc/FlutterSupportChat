import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oktoast/oktoast.dart';

enum NOTIFICATION_TYPE { primary, info, success, danger, warning }

class NotificationsService {
  Color _getColorForType(NOTIFICATION_TYPE type) {
    switch (type) {
      case NOTIFICATION_TYPE.info:
        return Colors.lightBlue;
      case NOTIFICATION_TYPE.success:
        return Colors.green;
      case NOTIFICATION_TYPE.warning:
        return Colors.orange;
      case NOTIFICATION_TYPE.danger:
        return Colors.red;

      case NOTIFICATION_TYPE.primary:
      default:
        return Colors.blue;
    }
  }

  _notify({
    String title,
    String message,
    IconData icon = FontAwesomeIcons.bell,
    NOTIFICATION_TYPE type = NOTIFICATION_TYPE.primary,
    int timeout = 3,
  }) {
    var textColor = Colors.white;
    showToastWidget(
      Material(
        color: Colors.transparent,
        child: Container(
          color: Colors.transparent,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: InkWell(
              onTap: () => dismissAllToast(showAnim: true),
              child: Container(
                color: _getColorForType(type),
                padding: EdgeInsets.all(12),
                height: 80,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(icon ?? FontAwesomeIcons.bell, color: textColor),
                    Container(width: 8),
                    Expanded(
                      child: Text(
                        message,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      handleTouch: true,
      duration: Duration(seconds: timeout ?? 3),
    );
  }

  notify(
    String message, {
    String title,
    IconData icon,
    int timeout,
  }) {
    this._notify(
      title: title,
      message: message,
      icon: icon,
      type: NOTIFICATION_TYPE.primary,
      timeout: timeout,
    );
  }

  notifyInfo(
    String message, {
    String title,
    IconData icon,
    int timeout,
  }) {
    this._notify(
      title: title,
      message: message,
      icon: icon,
      type: NOTIFICATION_TYPE.info,
      timeout: timeout,
    );
  }

  notifySuccess(
    String message, {
    String title,
    IconData icon,
    int timeout,
  }) {
    this._notify(
      title: title,
      message: message,
      icon: icon,
      type: NOTIFICATION_TYPE.success,
      timeout: timeout,
    );
  }

  notifyWarning(
    String message, {
    String title,
    int timeout,
  }) {
    this._notify(
      title: title,
      message: message,
      icon: FontAwesomeIcons.exclamationTriangle,
      type: NOTIFICATION_TYPE.warning,
      timeout: timeout,
    );
  }

  notifyDanger(
    String message, {
    String title,
    int timeout,
  }) {
    this._notify(
      title: title,
      message: message,
      icon: FontAwesomeIcons.exclamationTriangle,
      type: NOTIFICATION_TYPE.danger,
      timeout: timeout,
    );
  }

  notifyError(
    String message, {
    String title,
    int timeout,
  }) {
    this.notifyDanger(
      message,
      title: title,
      timeout: timeout,
    );
  }
}
