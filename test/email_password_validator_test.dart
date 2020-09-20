import 'package:designpatterns/views/signup.view.dart';
import 'package:test/test.dart';

void main() {
//  test('title', () {
//    // step
//
//    // run
//
//    // verify
//  });

  test('empty email returns error string', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Email não pode ficar vazio!');
  });

  test('non-empty email return null', () {
    var result = EmailFieldValidator.validate('email@email.com');
    expect(result, null);
  });

  test('empty password returns error string', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password can\'t be empty!');
  });

  test('non-empty password return null', () {
    var result = PasswordFieldValidator.validate('123456');
    expect(result, null);
  });
}
