The notebooks in this folder are a minimal working example (MWE) demonstrating how randeigen can be used to defend against the gradient matching attack. 

As the training dataset is huge and requires significant compute resources to compute, we include a subset of the precomputed training examples provided in https://github.com/JonasGeiping/poisoning-gradient-matching/. These training examples are in the folder "poisoned_cifar10"

The notebooks are
- gradient_matching_no_randeigen.ipynb: A MWE of how a pretrained resnet18 model is susceptible to the precomputed poisoned samples generated using the gradient matching attack
- gradient_matching_with_randeigen.ipynb: A MWE of how randeigen is incorporated in the training process to filter out poisoned samples, and the resulting trained model does not misclassify the precomputed poisoned data, while mantaining comparable high training/test accuracy. 


Basic functionality test: Both notebooks should run successfully without any errors. 