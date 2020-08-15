/*
set arg=%1
copy %0 .\%~n0.java
javac %~n0.java
goto :start
*/
import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.util.List;
import java.util.stream.*;

public class Main {

    public static void main(String[] args) {
        try (Stream<Path> walk = Files.walk(Paths.get(args[0]))) {
            List<String> res = walk.filter(Files::isRegularFile).map(Path::toString).collect(Collectors.toList());
            res.forEach(p -> {
                try {
                    func(p);
                } catch (IOException ignored) {
                }
            });
        } catch (IOException ignored) {
        }
    }

    static void func(String file_path) throws IOException {

        StringBuilder result = new StringBuilder(file_path.substring(file_path.lastIndexOf('\\') + 1) + " - ");
        File imageFile = new File(file_path);
        BufferedImage image = ImageIO.read(imageFile);

        for (int x = 180; x < 490; x += 72) {

            Color color = new Color(image.getRGB(x, 600));
            if ((color.getBlue() >= color.getGreen()) && (color.getBlue() >= color.getRed()) && color.getBlue() > 110) {
                Color c_1 = new Color(image.getRGB(175 + x - 180, 645));
                Color c_2 = new Color(image.getRGB(184 + x - 180, 636));
                Color c_3 = new Color(image.getRGB(184 + x - 180, 650));

                if (check(160, 593, 153, 612, 165, 612, 165, 599, 152, 606, 155, 600, x, image)) result.append("2");
                else if (check(151, 613, 167, 613, 160, 607, 154, 598, 166, 596, 148, 594, x, image)) result.append("3");
                else if (check(151, 606, 169, 607, 166, 613, 166, 592, 154, 596, 154, 596, x, image)) result.append("4");
                else if (check(154, 592, 159, 592, 155, 602, 166, 606, 164, 596, 164, 596, x, image)) result.append("5");
                else if (check(156, 602, 165, 602, 154, 605, 165, 596, 165, 598, 165, 598, x, image)) result.append("6");
                else if (check(153, 593, 166, 593, 159, 593, 155, 613, 153, 599, 153, 599, x, image)) result.append("7");
                else if (check(154, 598, 153, 608, 165, 597, 166, 608, 152, 602, 166, 592, x, image)) result.append("8");
                else if (check(166, 602, 159, 605, 166, 597, 154, 599, 156, 607, 166, 613, x, image)) result.append("9");
                else if (check(149, 594, 167, 592, 154, 613, 175, 602, 158, 593, 158, 593, x, image)) result.append("10");
                else if (check(163, 592, 163, 601, 162, 609, 153, 610, 154, 594, 154, 594, x, image)) result.append("J");
                else if (check(156, 596, 170, 596, 166, 606, 163, 612, 161, 602, 161, 602, x, image)) result.append("Q");
                else if (check(154, 592, 169, 613, 154, 613, 153, 602, 158, 598, 160, 593, x, image)) result.append("K");
                else if (check(152, 613, 171, 613, 160, 608, 160, 592, 157, 592, 157, 592, x, image)) result.append("A");

                if (c_3.getRed() > 70) {
                    if (c_2.getRed() > c_2.getBlue()) {
                        result.append("d");
                    } else result.append("h");
                } else if (c_1.getBlue() > c_1.getRed()) {
                    result.append("s");
                } else result.append("c");
            }
        }
        System.out.println(result);
    }

    private static boolean check(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4, int x5, int y5, int x6, int y6, int n, BufferedImage image) {

        Color back = new Color(image.getRGB(185 + n - 180, 600));
        int t = back.getBlue();
        Color test_color = new Color(image.getRGB(x1 + n - 180, y1));
        int test_1 = test_color.getBlue();
        test_color = new Color(image.getRGB(x2 + n - 180, y2));
        int test_2 = test_color.getBlue();
        test_color = new Color(image.getRGB(x3 + n - 180, y3));
        int test_3 = test_color.getBlue();
        test_color = new Color(image.getRGB(x4 + n - 180, y4));
        int test_4 = test_color.getBlue();
        test_color = new Color(image.getRGB(x5 + n - 180, y5));
        int test_5 = test_color.getBlue();
        test_color = new Color(image.getRGB(x6 + n - 180, y6));
        int test_6 = test_color.getBlue();

        return (test_1 != t) && (test_2 != t) && (test_3 != t) && (test_4 != t) && (test_5 == t) && (test_6 == t);
    }
}

/*
:start
cls
java %~n0.java %arg%
:: & */