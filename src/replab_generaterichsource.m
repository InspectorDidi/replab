function replab_generaterichsource
    [srcRoot, name, ~] = fileparts(mfilename('fullpath'));
    [root, ~] = fileparts(srcRoot);
    docsrcRoot = fullfile(root, 'docsrc');

    %% Prepare test directory structure
    switch exist(docsrcRoot)
      case 7
        disp('docsrc directory exists, removing it');
        if replab.platformIsOctave
            confirm_recursive_rmdir (false, 'local');
        end
        rmdir(docsrcRoot, 's');
      case 0
        disp('Docsrc directory does not exist yet');
      otherwise
        error('Unknown type')
    end

    % Create subfolder if inexistent
    [success, message, messageid] = mkdir(root, 'docsrc');
    
    disp('Crawling code base');
    codeBase = replab.infra.CodeBase.crawl(fullfile(root, 'src'));
    
    disp('Writing tests');
    codeBase.writeEnrichedSource(docsrcRoot);
end