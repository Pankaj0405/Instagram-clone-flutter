import 'dart:io';

void printFileNames(Directory directory, {String parent = ''}) {
  String folderName = directory.path.split(Platform.pathSeparator).last;

  if (parent.isNotEmpty) {
    folderName = parent + ' - ' + folderName;

  }



  directory.listSync().forEach((entity) {
    if (entity is Directory) {
      printFileNames(entity, parent: folderName);
    } else if (entity is File) {
      print(folderName + ' - ' + entity.path.split(Platform.pathSeparator).last);
    }
  });
}

void main() {
  // Provide the root directory path here
  String rootDirectoryPath = 'lib';

  Directory rootDirectory = Directory(rootDirectoryPath);
  printFileNames(rootDirectory);
}
