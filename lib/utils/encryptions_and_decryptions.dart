import 'package:encrypt/encrypt.dart';
import 'package:lawbook/models/file_model.dart';
import 'package:lawbook/models/hearing_model.dart';
import 'package:lawbook/models/party_model.dart';

class Cryptography {
  Cryptography();

  FileModel encryptDataInFileModel({required FileModel file}) {
    // hearing detail encryptions
    var hearings = file.hearings.map(
      (e) {
        return Hearing(
            date: encryptAES(e.date), description: encryptAES(e.description));
      },
    ).toList();

    // clinet and oppn encryption
    var client = Party(
      name: encryptAES(file.client.name),
      stand: encryptAES(file.client.stand),
      description: encryptAES(file.client.description),
      phone: encryptAES(file.client.phone),
      advocateRep: encryptAES(file.client.advocateRep),
    );

    // clinet and oppn encryption
    var oppn = Party(
      name: encryptAES(file.opposition.name),
      stand: encryptAES(file.opposition.stand),
      description: encryptAES(file.opposition.description),
      phone: encryptAES(file.opposition.phone),
      advocateRep: encryptAES(file.opposition.advocateRep),
    );

    return FileModel(
        court: encryptAES(file.court),
        caseNo: encryptAES(file.caseNo),
        section: encryptAES(file.section),
        sectionDetails: encryptAES(file.sectionDetails),
        client: client,
        opposition: oppn,
        importance: file.importance,
        isOver: file.isOver,
        files: encryptAES(file.files),
        caseDescription: encryptAES(file.caseDescription),
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
      stand: decryptAES(file.client.stand),
      description: decryptAES(file.client.description),
      phone: decryptAES(file.client.phone),
      advocateRep: decryptAES(file.client.advocateRep),
    );

    // oppn decrypt
    var oppn = Party(
      name: decryptAES(file.opposition.name),
      stand: decryptAES(file.opposition.stand),
      description: decryptAES(file.opposition.description),
      phone: decryptAES(file.opposition.phone),
      advocateRep: decryptAES(file.opposition.advocateRep),
    );

    return FileModel(
        court: decryptAES(file.court),
        caseNo: decryptAES(file.caseNo),
        section: decryptAES(file.section),
        sectionDetails: decryptAES(file.sectionDetails),
        client: client,
        opposition: oppn,
        importance: file.importance,
        isOver: file.isOver,
        caseDescription: decryptAES(file.caseDescription),
        hearings: hearings,
        files: decryptAES(file.files));
  }

  static encryptAES(plainText) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    return encrypter.encrypt(plainText, iv: iv);
  }

  static decryptAES(encrypted) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    return encrypter.decrypt(encrypted!, iv: iv);
  }
}
