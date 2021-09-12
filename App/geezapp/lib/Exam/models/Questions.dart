class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "የ 'ሖረ' ግስ የአማርኛ ፍቺ ምንድነው?",
    "options": ['ሐዋረ', 'ተማረ', 'ሄደ', 'ተቀመጠ'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "በግዕዝ ሰላምታ ለወንድ እንዴት ነው ሚባለው?",
    "options": ['ሰላም ላንቺ', 'ሰላም ለናንት', 'ሰላም ለሊሁ', 'ሰላም ለከ'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "በግዕዝ ሰላምታ ለብዙ ሰዎች እንዴት ነው ሚባለው?",
    "options": ['ቅኔ የግዕዝ ዓረፍት ነገር ክፍል ነው።', 'ዓረፍት ነገር ትርጉም የሚሰጥ የፊደላት ስበሰብ ነው።', 'ፊደላት ዓረፍተ ነገር መሆን ይችላሉ።', 'ሁሉም መልስ ይሆናሉ'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "ከሚከተሉት ወስጥ ትከከለኛወን የ'ነበረ' ግስ ትዕዛዝ አወራረድ የቱ ነው።",
    "options": ['"ነቢር"', 'ይነበሮ', 'ነባሪያን', 'ፈጢር'],
    "answer_index": 2,
  },
];
