import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'upload_photos_state.dart';

class UploadPhotosCubit extends Cubit<UploadPhotosState> {
  UploadPhotosCubit() : super(UploadPhotosInitial());
  XFile? imagegallery;

  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    imagegallery = await picker.pickImage(source: ImageSource.gallery);
  }

  Future<void> getcamera() async {
    final ImagePicker picker = ImagePicker();
    imagegallery = await picker.pickImage(source: ImageSource.camera);
  }
}
