import 'dart:io';
import 'package:path/path.dart' as path;

String changeFileName(File namefile, String name) {
  File temp = namefile;
  String dir = path.dirname(temp.path);
  String newPath = path.join(dir, name);

  temp.renameSync(newPath);

  return newPath;
}
