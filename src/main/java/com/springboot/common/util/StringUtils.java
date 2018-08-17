package com.springboot.common.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.text.NumberFormat;
import java.util.Random;

public class StringUtils {

    /**
     * 给整数左补位：0|空格
     *
     * @param i
     * @param len
     * @return
     */
    public static String StringLeftpad(int i, int len) {
        // 得到一个NumberFormat的实例
        NumberFormat nf = NumberFormat.getInstance();
        // 设置是否使用分组
        nf.setGroupingUsed(false);
        // 设置最大整数位数
        nf.setMaximumIntegerDigits(len);
        // 设置最小整数位数
        nf.setMinimumIntegerDigits(len);
        return nf.format(i);
    }

    /**
     * 格式补位
     *
     * @param n
     * @return
     */
    public static String formatString(int n) {
        // 0 代表前面补充0
        // 4 代表长度为4
        // d 代表参数为正数型
        return String.format("%04d", n);
    }

    /**
     * 获取随机汉字
     *
     * @return
     */
    private static char getRandomChar() {
        String str = "";
        int hightPos;
        int lowPos;
        Random random = new Random();
        hightPos = (176 + Math.abs(random.nextInt(39)));
        lowPos = (161 + Math.abs(random.nextInt(93)));
        byte[] b = new byte[2];
        b[0] = (Integer.valueOf(hightPos)).byteValue();
        b[1] = (Integer.valueOf(lowPos)).byteValue();
        try {
            str = new String(b, "GBK");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            System.out.println("错误");
        }

        return str.charAt(0);
    }

    public static void getRandomNbr() {
        // 使用java.lang.Math的random方法生成随机数
        System.out.println("Math.random(): " + Math.random());
        // 使用不带参数的构造方法构造java.util.Random对象
        System.out.println("使用不带参数的构造方法构造的Random对象:");
        Random rd1 = new Random();
        // 产生各种类型的随机数
        // 按均匀分布产生整数
        System.out.println("int: " + rd1.nextInt());
        // 按均匀分布产生长整数
        System.out.println("long: " + rd1.nextLong());
        // 按均匀分布产生大于等于0，小于1的float数[0, 1)
        System.out.println("float: " + rd1.nextFloat());
        // 按均匀分布产生[0, 1)范围的double数
        System.out.println("double: " + rd1.nextDouble());
        // 按正态分布产生随机数
        System.out.println("Gaussian: " + rd1.nextGaussian());

        // 指定随机数产生的范围
        System.out.print("[0,10)范围内随机整数序列: ");
        for (int i = 0; i < 10; i++) {
            // Random的nextInt(int n)方法返回一个[0, n)范围内的随机数
            System.out.print(rd1.nextInt(10) + "  ");
        }
        System.out.println();
        System.out.print("[5,23)范围内随机整数序列: ");
        for (int i = 0; i < 10; i++) {
            // 因为nextInt(int n)方法的范围是从0开始的，
            // 所以需要把区间[5,28)转换成5 + [0, 23)。
            System.out.print(5 + rd1.nextInt(23) + "  ");
        }
        System.out.println();
        System.out.print("利用nextFloat()生成[0,99)范围内的随机整数序列: ");
        for (int i = 0; i < 10; i++) {
            System.out.print((int) (rd1.nextFloat() * 100) + "  ");
        }
        System.out.println();
        System.out.println();

        // 使用带参数的构造方法构造Random对象
        // 构造函数的参数是long类型，是生成随机数的种子。
        System.out.println("使用带参数的构造方法构造的Random对象:");
        Random ran2 = new Random(10);
        // 对于种子相同的Random对象，生成的随机数序列是一样的。
        System.out.println("使用种子为10的Random对象生成[0,10)内随机整数序列: ");
        for (int i = 0; i < 10; i++) {
            System.out.print(ran2.nextInt(10) + "  ");
        }
        System.out.println();
        Random ran3 = new Random(10);
        System.out.println("使用另一个种子为10的Random对象生成[0,10)内随机整数序列: ");
        for (int i = 0; i < 10; i++) {
            System.out.print(ran3.nextInt(10) + "  ");
        }
    }

    /**
     * 根据IP地址获取mac地址
     *
     * @param ipAddress 127.0.0.1
     * @return
     * @throws SocketException
     * @throws UnknownHostException
     */
    public static String getLocalMac(String ipAddress) throws SocketException,
            UnknownHostException {
        String str = "";
        String macAddress = "";
        final String LOOPBACK_ADDRESS = "127.0.0.1";
        // 如果为127.0.0.1,则获取本地MAC地址。
        if (LOOPBACK_ADDRESS.equals(ipAddress)) {
            InetAddress inetAddress = InetAddress.getLocalHost();
            // 貌似此方法需要JDK1.6。
            byte[] mac = NetworkInterface.getByInetAddress(inetAddress)
                    .getHardwareAddress();
            // 下面代码是把mac地址拼装成String
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < mac.length; i++) {
                if (i != 0) {
                    sb.append("-");
                }
                // mac[i] & 0xFF 是为了把byte转化为正整数
                String s = Integer.toHexString(mac[i] & 0xFF);
                sb.append(s.length() == 1 ? 0 + s : s);
            }
            // 把字符串所有小写字母改为大写成为正规的mac地址并返回
            macAddress = sb.toString().trim().toUpperCase();
            return macAddress;
        } else {
            // 获取非本地IP的MAC地址
            try {
                System.out.println(ipAddress);
                Process p = Runtime.getRuntime()
                        .exec("nbtstat -A " + ipAddress);
                System.out.println("===process==" + p);
                InputStreamReader ir = new InputStreamReader(p.getInputStream());

                BufferedReader br = new BufferedReader(ir);

                while ((str = br.readLine()) != null) {
                    if (str.indexOf("MAC") > 1) {
                        macAddress = str.substring(str.indexOf("MAC") + 9, str.length());
                        macAddress = macAddress.trim();
                        System.out.println("macAddress:" + macAddress);
                        break;
                    }
                }
                p.destroy();
                br.close();
                ir.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
            return macAddress;
        }
    }

    public static void main(String[] args) throws SocketException, UnknownHostException {
        String s = StringLeftpad(10, 12);
        System.out.println(s);
        System.out.println(formatString(211));
        System.out.println(getRandomChar());
        getRandomNbr();
        System.out.println();
        System.out.println(getLocalMac("127.0.0.1"));
    }
}
