import 'package:email/email.dart' as email;

void main(List<String> arguments) {

  bool isValidEmailAddress(EmailAddress email) {
    return email.address.contains('@');
  }

  Iterable<EmailAddress> parseEmailAddresses(Iterable<String> strings) {
    return strings.map((string) => EmailAddress(string));
  }

  bool anyInvalidEmailAddress(Iterable<EmailAddress> emails) {
    return emails.any((email) => !isValidEmailAddress(email));
  }

  Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emails) {
    return emails.where((email) => isValidEmailAddress(email));
  }

  Iterable<String> stringEmailAddressList = ['12345', 'abcd@gmail.com', 'test@hotmail.com', '56789'];
  Iterable<EmailAddress> emailAddressList = parseEmailAddresses(stringEmailAddressList);
  print(emailAddressList);
  print(anyInvalidEmailAddress(emailAddressList));
  print(validEmailAddresses(emailAddressList));

}

class EmailAddress {
  final String address;

  EmailAddress(this.address);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EmailAddress &&
              address == other.address;

  @override
  int get hashCode => address.hashCode;

  @override
  String toString() {
    return 'EmailAddress{address: $address}';
  }

}
