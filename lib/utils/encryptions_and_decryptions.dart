import 'package:encrypt/encrypt.dart';
import 'package:encryptor/encryptor.dart';
import 'package:lawbook/models/file_model.dart';
import 'package:lawbook/models/hearing_model.dart';
import 'package:lawbook/models/party_model.dart';

class Cryptography {
  Cryptography();
  final String key = 'Key to encrypt and decrpyt the plain text';

  FileModel encryptDataInFileModel({required FileModel file}) {
    // hearing detail encryptions
    var hearings = file.hearings.map(
      (e) {
        return Hearing(
            date: ecptE(e.date.toString()),
            description: ecptE(e.description.toString()));
      },
    ).toList();

    // clinet and oppn encryption
    var client = Party(
      name: ecptE(file.client.name.toString()),
      side: ecptE(file.client.side.toString()),
      phone: ecptE(file.client.phone.toString()),
      address: ecptE(file.client.address.toString()),
      advocateRep: ecptE(file.client.advocateRep.toString()),
    );

    // clinet and oppn encryption
    var oppn = Party(
      name: ecptE(file.opposition.name.toString()),
      side: ecptE(file.opposition.side.toString()),
      phone: ecptE(file.opposition.phone.toString()),
      address: ecptE(file.opposition.address.toString()),
      advocateRep: ecptE(file.opposition.advocateRep.toString()),
    );

    return FileModel(
        court: ecptE(file.court.toString()),
        caseNo: ecptE(file.caseNo.toString()),
        section: ecptE(file.section.toString()),
        client: client,
        isLegalAid: file.isLegalAid,
        opposition: oppn,
        importance: file.importance,
        isLive: file.isLive,
        files: ecptE(file.files.toString()),
        caseDescription: ecptE(file.caseDescription.toString()),
        hearings: hearings);
  }

  decryptDataInFileModel({required FileModel file}) {
    // hearing decryption
    var hearings = file.hearings.map((e) {
      return Hearing(
          date: decryptAES(e.date), description: decryptAES(e.description));
    }).toList();

    // client decrypt
    var client = Party(
      name: decryptAES(file.client.name),
      side: decryptAES(file.client.side),
      phone: decryptAES(file.client.phone),
      address: decryptAES(file.client.address),
      advocateRep: decryptAES(file.client.advocateRep),
    );

    // oppn decrypt
    var oppn = Party(
      name: decryptAES(file.opposition.name),
      side: decryptAES(file.opposition.side),
      phone: decryptAES(file.opposition.phone),
      address: decryptAES(file.opposition.address),
      advocateRep: decryptAES(file.opposition.advocateRep),
    );

    return FileModel(
        court: decryptAES(file.court),
        caseNo: decryptAES(file.caseNo),
        section: decryptAES(file.section),
        isLegalAid: file.isLegalAid,
        client: client,
        opposition: oppn,
        importance: file.importance,
        isLive: file.isLive,
        caseDescription: decryptAES(file.caseDescription),
        hearings: hearings,
        files: decryptAES(file.files));
  }

  encryptAES(plainText) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    return encrypter.encrypt(plainText, iv: iv).toString();
  }

  decryptAES(encrypted) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    return encrypter.decrypt(encrypted!, iv: iv).toString();
  }

  ecptE(plain) {
    return Encryptor.encrypt(key, plain);
  }
}
