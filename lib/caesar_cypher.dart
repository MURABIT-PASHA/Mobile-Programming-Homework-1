class CaesarCypher{
  int number = 0;
  String text = "";
  CaesarCypher(this.text, this.number);
  List alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
  List encryptedAlphabet=[];
  String encrypt() {
    String text = this.text;
    int shift = number;
    String encryptedWord = "";
    for (int j = shift; j < alphabet.length - shift; j++){
      encryptedAlphabet.add(alphabet[j]);
    }
    for (int i = 0 ; i < shift ; i++){
      encryptedAlphabet.add(alphabet[shift+i]);
    }
    List word = text.split("");
    for (int k = 0 ; k < word.length ; k++){
        int index = alphabet.indexWhere((element) => element == word[k]);
        encryptedWord += encryptedAlphabet[index];
    }
    return encryptedWord;
  }

}