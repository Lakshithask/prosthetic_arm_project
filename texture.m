% Set path to the directory containing the CSV files
path_to_files = 'E:\Internship work\EEG Signal\wrist ccw';

% Set the desired size of the square texture images (in pixels)
img_size = 256;

% Get a list of all the CSV files in the directory
file_list = dir(fullfile(path_to_files, '*.csv'));

% Loop through each CSV file in the directory
for i = 1:length(file_list)
    
    % Load the CSV file
    filename = fullfile(path_to_files, file_list(i).name);
    data = csvread(filename);
    
    % Reshape the EEG data into a square matrix
    n = floor(sqrt(length(data)));
    data_square = reshape(data(1:n^2), [n, n]);
    
    % Resize the square matrix to the desired image size
    img = imresize(data_square, [img_size, img_size]);
    
    % Create a texture image from the resized matrix
    % Here, we'll assign each data point to a grayscale value
    img = mat2gray(img);
    
    % Save the texture image
    [~, filename_no_ext, ~] = fileparts(filename);
    imwrite(img, fullfile(path_to_files, [filename_no_ext '.jpg']));
    
end
