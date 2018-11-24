clear;
run  matlab/vl_setupnn % matconvnet has to be compiled before running the code: http://www.vlfeat.org/matconvnet/install/

%% load the pre-trained CNN
net = load('imagenet-vgg-f.mat') ; % this model can be found on http://www.vlfeat.org/matconvnet/pretrained/
net = vl_simplenn_tidy(net) ;

%% setting up the paths
occupydata = dir(fullfile('PATH\ TO\ OCCUPIED\ DATASET\ FOLDER FOR TRAINING','Occupied','*.jpg'));
%the PKLot dataset has to be downloaded and the path has to be uploaded for the occupied lots available at: https://web.inf.ufpr.br/vri/databases/parking-lot-database/
occupydata = {occupydata.name}';
emptydata = dir(fullfile('PATH\ TO\ EMPTY\ DATASET\ FOLDER FOR TRAINING','Empty','*.jpg')); % the path has to be uploaded for the empty plots of the PKlot dataset
emptydata = {emptydata.name}';
testdata = dir(fullfile('PATH\ TO \A \DIFFERENT \DATASET \FOLDER FOR TESTING','*.jpg')); % A separate dataset should be used to check the transfer learning ability
testdata = {testdata.name}';


total = length(occupydata)+ length(emptydata);

%% creating feature vectors and labels
training_matrix= zeros(total, 1000);
for i=1:length(occupydata)
        labels(i,1)=1;
		%preprocessing
        im = imread (fullfile ( 'PATH\ TO\ OCCUPIED\ DATASET\ FOLDER FOR TRAINING','Occupied', occupydata{i}));
        im_ = single(im) ; % note: 0-255 range
        im_ = imresize(im_, net.meta.normalization.imageSize(1:2)) ;
        im_ = bsxfun(@minus, im_, net.meta.normalization.averageImage) ;
    % run the CNN
        res = vl_simplenn(net, im_) ;   
        training_matrix(i,:) = res(21).x(:);
end
 
for ii=(length(occupydata)+1):total
        labels(ii,1)=0;
		%preprocessing
        im2 = imread (fullfile ( 'PATH\ TO\ EMPTY\ DATASET\ FOLDER FOR TRAINING','Empty', (emptydata{ii-length(occupydata)})));
        im2_ = single(im2) ; % note: 0-255 range
        im2_ = imresize(im2_, net.meta.normalization.imageSize(1:2)) ;
        im2_ = bsxfun(@minus, im2_, net.meta.normalization.averageImage) ;
    % run the CNN
        res = vl_simplenn(net, im2_) ;
        training_matrix(ii,:) = res(21).x(:);
 
 
end
training_matrix(:,1001)=labels(:,1);

%% training the classifier. We used all the images of during training
[trainedClassifier, validationAccuracy] = trainClassifier(training_matrix); %this provides the trained classifier file that can be used for transfer learning tasks


%% test occupied data for accuracy
for i=1:length(testdata)
	%preprocessing
        im = imread (fullfile ( 'PATH\ TO \A \DIFFERENT \DATASET \FOLDER FOR TESTING','Occupied', testdata{i})); % change this to another dataset to check transfer learning ability
        im_ = single(im) ; % note: 0-255 range
        im_ = imresize(im_, net.meta.normalization.imageSize(1:2)) ;
        im_ = bsxfun(@minus, im_, net.meta.normalization.averageImage) ;
    % run the CNN
        res = vl_simplenn(net, im_) ;
        X(i,:) = res(21).x(:);
		yfit(i) = trainedClassifier.predictFcn(X(i,:)); %yfit contains the labels of the classifications "1" means occupied "0" means unoccupied
end


