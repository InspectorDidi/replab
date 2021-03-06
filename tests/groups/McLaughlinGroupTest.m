function test_suite = McLaughlinGroupTest()
    disp(['Setting up tests in ', mfilename()]);
    try
        test_functions = localfunctions();
    catch
    end
    initTestSuite;
end

function test_order
    if ReplabTestParameters.onlyFastTests
        return
    end
    S275 = replab.Permutations(275);

    g1 = S275.fromCycles([1, 191], [2, 182], [4, 81], [5, 55], [6, 60], [8, 66], [9, 272], [10, 177], [11, 192], [12, 163],  [14, 242], [15, 133], [16, 107], [18, 267], [19, 108], [20, 218], [21, 198], [22, 185], [23, 211], [24, 82], [25, 204], [26, 195], [27, 132], [28, 253], [29, 207], [30, 59], [31, 179], [32, 154], [33, 264], [34, 152], [35, 92], [36, 189], [37, 217], [38, 197], [39, 85], [40, 156], [42, 184], [43, 102], [44, 50], [45, 216], [46, 99], [47, 181], [49, 199], [51, 111], [53, 158], [54, 236], [56, 210], [58, 103], [61, 263], [63, 119], [64, 138], [65, 127], [67, 105], [68, 137], [70, 125], [71, 144], [72, 219], [73, 261], [75, 175], [77, 269], [78, 237], [79, 268], [83, 232], [84, 256], [86, 104], [87, 95], [89, 234], [90, 233], [91, 140], [94, 149], [97, 173], [98, 160], [100, 112], [101, 123], [106, 221], [109, 131], [110, 176], [113, 262], [114, 257], [115, 201], [117, 260], [118, 238], [120, 275], [121, 214], [122, 225], [124, 246], [126, 170], [129, 141], [134, 196], [135, 167], [142, 235], [143, 224], [145, 205], [146, 249], [148, 226], [150, 243], [153, 193], [155, 228], [161, 231], [164, 215], [165, 180], [168, 222], [169, 270], [171, 241], [172, 259], [174, 212], [178, 188], [183, 266], [186, 203], [190, 250], [202, 247], [208, 255], [209, 251], [213, 252], [223, 271], [227, 274], [230, 240], [239, 254], [245, 258], [265, 273]);

    g2 = S275.fromCycles([1, 24, 204, 92, 155], [2, 28, 272, 165, 78], [3, 67, 142, 31, 255], [4, 168, 77, 17, 100], [5, 118, 19, 223, 211], [6, 274, 137, 79, 245], [7, 98, 75, 73, 14], [8, 209, 43, 139, 193], [9, 266, 104, 70, 145], [10, 271, 12, 13, 71], [11, 247, 138, 121, 269], [15, 218, 133, 164, 196], [16, 170, 182, 65, 171], [18, 26, 198, 124, 185], [20, 128, 159, 83, 38], [21, 264, 27, 64, 162], [22, 116, 53, 101, 51], [23, 179, 244, 80, 203], [25, 40, 177, 85, 191], [29, 56, 135, 68, 195], [30, 132, 42, 248, 146], [32, 148, 114, 49, 134], [33, 61, 163, 90, 227], [34, 241, 233, 95, 181], [35, 89, 82, 205, 41], [36, 239, 275, 257, 183], [37, 54, 99, 249, 176], [39, 126, 189, 136, 230], [44, 172, 153, 125, 119], [45, 234, 222, 232, 212], [46, 214, 69, 167, 190], [47, 140, 268, 174, 62], [48, 55, 113, 220, 235], [50, 213, 224, 202, 130], [52, 107, 262, 226, 88], [57, 221, 261, 129, 58], [59, 252, 260, 216, 166], [60, 84, 188, 208, 201], [63, 94, 173, 210, 81], [66, 192, 93, 169, 110], [72, 152, 197, 217, 254], [74, 206, 154, 186, 219], [76, 91, 180, 238, 112], [86, 215, 231, 131, 225], [87, 115, 158, 178, 240], [96, 265, 161, 120, 144], [97, 250, 243, 263, 109], [102, 207, 246, 122, 127], [103, 156, 160, 151, 150],  [105, 267, 199, 111, 117], [106, 273, 242, 149, 143], [108, 256, 157, 147, 184], [123, 141, 259, 175, 200], [187, 251, 258, 194, 236], [228, 237, 253, 270, 229]);

    McL = S275.subgroup({g1, g2});
    assert(McL.order == vpi('898128000'));
end
