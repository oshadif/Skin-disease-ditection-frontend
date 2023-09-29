import 'dart:io';
import 'package:sdgp/screens/display_disease/disease/diseaseTypes.dart';
import 'package:flutter/material.dart';
import 'package:sdgp/constants.dart';
import 'package:sdgp/screens/display_disease/disease/disease_details.dart';
import 'package:tflite/tflite.dart';

class Disease extends StatefulWidget {
  final String imagePath;


  Disease({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<Disease> createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  List? result;
  DiseaseTypes? disease;
  final List<DiseaseTypes> skinDiseases = [
    DiseaseTypes(
        name: 'Acne',
        shortDescription: 'Skin condition causing pimples & blackheads',
        description:
        'Acne is a common skin condition that occurs when hair follicles become clogged with oil and dead skin cells. This can result in pimples, blackheads, and whiteheads on the face, neck, chest, and back. Acne can be caused by a variety of factors, including hormones, genetics, and certain medications. Treatment options for acne include topical creams and gels, oral medications, and lifestyle changes such as a healthy diet and regular exercise. In severe cases, laser and light therapies or chemical peels may be recommended.',
        treatmentOptions:
        'Topical creams, oral medications, lifestyle changes, laser/light therapies, chemical peels'),
    DiseaseTypes(
        name: 'Psoriasis',
        shortDescription:
        'Chronic autoimmune disease causing red, scaly patches',
        description:
        'Psoriasis is a chronic autoimmune disease that affects the skin, causing red, scaly patches to form. It is thought to be caused by a malfunction in the immune system, which causes skin cells to grow too quickly and form patches. Psoriasis can be triggered by stress, infection, or injury to the skin. Treatment options for psoriasis include topical creams and ointments, oral medications, and phototherapy, which uses ultraviolet light to slow the growth of skin cells.',
        treatmentOptions:
        'Topical creams and ointments, oral medications, phototherapy'),
    DiseaseTypes(
        name: 'Chickenpox',
        shortDescription:
        'Highly contagious viral infection causing itchy blisters',
        description:
        'Chickenpox is a highly contagious viral infection that causes an itchy rash with blisters. It is most common in children, but can occur in adults as well. The virus is spread through direct contact with the rash or through respiratory droplets. Symptoms of chickenpox include fever, headache, and a rash that spreads all over the body. Treatment options for chickenpox include antiviral medications and over-the-counter remedies to alleviate symptoms such as fever and itching.',
        treatmentOptions: 'Antiviral medications, over-the-counter remedies'),
    DiseaseTypes(
        name: 'Blister',
        shortDescription:
        'Fluid-filled sac on skin caused by friction or burns',
        description:
        'A blister is a fluid-filled sac that forms on the skin as a result of friction or burns. Blisters can be painful and can take several days or weeks to heal. Treatment options for blisters include keeping the affected area clean and dry, applying a sterile bandage or dressing, and avoiding activities that may cause further irritation. In some cases, a doctor may need to drain the blister or prescribe antibiotics if it becomes infected.',
        treatmentOptions:
        'Keep clean and dry, apply sterile bandage/dressing, avoid irritation, drainage, antibiotics'),
    DiseaseTypes(
        name: 'Melanoma',
        shortDescription: 'Dangerous form of skin cancer',
        description:
        'Melanoma is a dangerous form of skin cancer that occurs when melanocytes, the cells that produce skin pigment, become cancerous. Melanoma can develop anywhere on the body, and is often characterized by changes in the size, shape, or color of a mole or other skin lesion. Treatment options for melanoma include surgical removal of the affected area, radiation therapy, chemotherapy, and immunotherapy. Early detection and treatment is critical for a positive outcome.',
        treatmentOptions:
        'Surgical removal, radiation therapy, chemotherapy, immunotherapy'),
    DiseaseTypes(
        name: 'Eczema',
        shortDescription:
        'Chronic skin condition causing itching and inflammation',
        description:
        'Eczema is a chronic skin condition that causes the skin to become itchy, red, and inflamed. It is a common condition that affects people of all ages, from infants to the elderly. The exact cause of eczema is unknown, but it is believed to be related to a combination of genetic and environmental factors. Eczema can occur anywhere on the body, but it is most commonly found on the hands, feet, and face.\n\nEczema is a long-term condition that requires ongoing management. Treatment options include using moisturizers to keep the skin hydrated, avoiding triggers that can cause flare-ups, and using topical corticosteroids to reduce inflammation. In severe cases, oral medications or light therapy may be necessary.\n\nIt is important to seek medical advice if you have eczema, as it can lead to complications such as skin infections or sleep disturbance. While there is no cure for eczema, with proper management, most people with the condition can lead a normal, healthy life.',
        treatmentOptions:
        'Moisturizers, avoiding triggers, topical corticosteroids, oral medications, light therapy')
  ];

  DiseaseTypes getSkinDiseaseByIndex(int index) {
    return skinDiseases[index];
  }

  @override
  void initState() {
    super.initState();
    loadModelData().then((output) {
      setState(() {
        result = null;
      });
    });
  }

  loadModelData() async {
    await Tflite.loadModel(
        model: "model/model_unquant.tflite", labels: "model/labels.txt");
    detectDisease();
  }

  void detectDisease() async {
    try {
      result = await Tflite.runModelOnImage(
        path: widget.imagePath,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5,
      );
      print("print result $result");
      disease = getSkinDiseaseByIndex(result![0]['index']);
      print(widget.imagePath);
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('Possible Conditions'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Identified Possible Conditions',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Icon(
                          Icons.warning,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Caution!',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'This is not a medical diagnosis.',
                              style:
                                  TextStyle(fontSize: 10.0, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kButtonColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.file(
                          File(widget.imagePath),
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            result == null
                                ? const Text('Image not found')
                                : Text(
                                    '${result![0]['label']}',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            const SizedBox(height: 8),
                            result == null?
                            const Text(
                              '',
                              style: TextStyle(fontSize: 13.0),
                            ):
                                Text(
                                  "${disease?.shortDescription}"
                                ),

                            const SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DiseaseDetails(
                                          imagePath: widget.imagePath, diseaseDetails:disease)),
                                );
                              },
                              child: const Text(
                                'See more',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
