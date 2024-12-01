import 'package:image_picker/image_picker.dart';

import 'toast.dart';

pickImage(ImageSource source) async{

  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if(file != null){
    return await file.readAsBytes();
  } else
  {
  showToast(message: "No Image Selected");
  }

}
