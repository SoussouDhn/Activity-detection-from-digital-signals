# Activity-detection-from-digital-signals
Use unsupervised classification to help recognize different classes of physical activity of people, based on digital signals of acceleration and speed data from smartphones.

Unsupervised learning project

1- Objectives
The objective of this project is to use unsupervised classification to help recognize, from acceleration and speed data from smartphones, different classes of physical activities of people: (1) walking, (2) going up the stairs, (3) going down the stairs, (4) sitting down, (5) getting up, (6) lying down. This is a problem formulated in [1] [2].

2- Data acquisition
To collect the data, 30 people aged 19 to 48 followed a course containing the various activities listed above. During each experiment (course), 6 will
riables were recorded every 0.02 seconds: 3 accelerations (along the x, y, z axes) and 3 angular speeds (along the x, y, z axes). A video extract of the experiments carried out can be
viewed via the link http://www.youtube.com/watch?v=XOEN9W05_4A.

3-Description of the data

To facilitate their analysis, the raw data from the experiments were pre-processed (filtering and normalization) then split into sliding windows of 128 successive observations (i.e. 2.5 seconds). Indeed, it seems more reasonable to detect the activities on time intervals rather than on specific instants.
At the end of this preprocessing, we have a new data set made up of 7352 individuals (each individual now corresponds to a time window) which are characterized by the
9 × 128 = 1152 following observations (in order):
- 128 accelerations measured along the x axis (called total acceleration),
- 128 accelerations measured along the y axis,
- 128 accelerations measured along the z axis,
- 128 accelerations estimated along the x axis (with elimination of effects linked to gravity),
- 128 accelerations estimated along the y axis,
- 128 accelerations estimated along the z axis,
- 128 angular speeds measured along the x axis,
- 128 angular speeds measured along the y axis,
- 128 angular speeds measured along the z axis.

The authors in [1] [2] suggested a set of 561 variables allowing to characterize these data. This dataset corresponds to the data2.txt file.
The following information is also available:
- real classes (values ​​between 1 and 6): labels.txt,
- identifiers of the people who carried out the experiments (between 1 and 30): id.txt,

The data.txt, data2.txt, labels.txt and id.txt data files can be downloaded at http://allousame.free.fr/mlds.

References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz (2012). Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria- Gasteiz, Spain.
[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz (2013). A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges.
2
