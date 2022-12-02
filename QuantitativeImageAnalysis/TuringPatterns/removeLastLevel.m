

function treeR = removeLastLevel(tree)


    treeR = tree(:,1:4:end);
    treeR(end,:) = [];
    

end

