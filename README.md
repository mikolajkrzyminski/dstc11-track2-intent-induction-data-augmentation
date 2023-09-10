# TAKE THE MOST OUT OF Text Data Augmentation Strategies For Intent Clustering And Induction Based On DSTC 11 Track 2

The repository contains experimental environment for augmentation approach to [DSTC11 TRACK 2](https://github.com/amazon-science/dstc11-track2-intent-induction) **[1] [2]**.

## DSTC 11 Track 2 Intent Clustering

"Requires participants to assign labels to turns in the dialogues where customers express intents."

<p align="center">
<img src="assets\dstc11t21.jpg" alt="drawing" />
</p>

## DSTC 11 Track 2 Open Intent Induction

"Participants must induce a set of intents from dialogues, with each intent defined by a list of sample utterances to be used as training data for an intent classifier."

![DSTC 11 Track 2 Open Intent Induction concept](assets\dstc11t22.jpg)

## Related work
There is a large amount of research that studies the leveraging of data augmentation (DA) for tasks in the NLP domain. The survey **[3]** proves the effectiveness of data augmentation for text classification by comparing methods of augmentation working on various text levels: character, word, and sentence. Although DA has been a widely explored domain, there isn’t currently any research on the particular topic of DA for unsupervised learning in NLP. Paper **[4]** explores the impact of unsupervised methods on the computer vision domain, where augmented data tend to increase the density and variety of particular classes which has a positive impact on overall results. The DA methods are widely known to improve various  models thus it may be beneficial to use in intent clustering (see **Figure 1, 2**). 

The idea behind exploiting the DA came from observing the influence of the methods in unsupervised tasks. The methods are widely known to improve various language models in NLP challenges. Models trained with the addition of generated data tend to generalize better, furthermore methods can provide compensation to disproportions of rare classes. Utilizing DA is expected to improve overall quality of dataset thus it my be beneficial to use in clustering.

![General idea](assets\idea.jpg)

## Approach
The adopted solution is to modify only the given datasets, not the clustering algorithm  (see **Figure 3**). 

![Approach](assets\approach.jpg)

Text augmentation method is back-translation en->de->en, with the utilization of Opus-MT **[3]**. The particular models are chosen due to high similarity of the output translations to source data and are being chosen by other authors in similar problematic **[4]**. The 4’th best candidate translation is arbitrary picked (see **Figure 4**) to make the output text potentially more diverse. The The size of the generated set takes values in the range <0.0; 1.0> of the size of the source data.

![Back-translation](assets\translations.jpg)

## Results
**The results showed an improvement in the performance of the clustering and induction methods** (see **Table 1**, **Figure 6, 7**), which means that the data augmentation is beneficial to use in unsupervised techniques alike in the supervised methods.

The glove 300d representation is more susceptible to the effects of back translation augementation than for all-mpnet-base-v2, although all-mpnet-base-v2 performance better in both tasks.

![Results](assets\results.jpg)

## Experimental environment
Is in dstc11_experiment.ipynb file and can be run under Google Colab environment.

## References
1. Gung, J., Moeng, E., Rose, W., Gupta, A., Zhang, Y., & Mansour, S. (2023). NatCS: Eliciting Natural Customer Support Dialogues. 
2. Gung, J., Shu, R., Moeng, E., Rose, W., Romeo, S., Benajiba, Y., … Zhang, Y. (2023). Intent Induction from Conversations for Task-Oriented Dialogue Track at DSTC 11.
3. Bayer, M., Kaufhold, M., Reuter, C. 2022. A Survey on Data Augmentation for Text Classification. ACM Comput. Surv. 55, 7, Article 146 (July 2023).
4. Lim, S. K., Loo, Y., Tran, N.-T., Cheung, N.-M., Roig, G., & Elovici, Y. (2018). DOPING: Generative Data Augmentation for Unsupervised Anomaly Detection with GAN.
5. Tiedemann, J., & Thottingal, S. (2020). OPUS-MT — Building open translation services for the World. Proceedings of the 22nd Annual Conferenec of the European Association for Machine Translation (EAMT). Lisbon, Portugal.
6. Ido, Y., Sharkov, S., Yang, E. Data augmentation with adversarial examples and ... - Stanford University. 

