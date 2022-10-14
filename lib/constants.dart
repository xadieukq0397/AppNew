import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kLoginTitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.060,
      fontWeight: FontWeight.bold,
    );

TextStyle kLoginSubtitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.030,
    );

TextStyle kLoginTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: Colors.grey, height: 1.5);

TextStyle kHaveAnAccountStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: Colors.black);

TextStyle kLoginOrSignUpTextStyle(
  Size size,
) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: Colors.deepPurpleAccent,
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);
TextStyle kProductStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.017,
    );
const List<String> lImgProduct = [
  "https://cf.shopee.vn/file/4d6ca89f6bf93fa3997357451f78f097_tn",
  "https://cf.shopee.vn/file/77a05996c39ac02f7f4b3bd8441d098d",
  "https://cf.shopee.vn/file/0982de1d517eed28495a9bbcaced5881",
  "https://cf.shopee.vn/file/26635c69cd0f47fbd86150bbb8a43aa3",
  "https://cf.shopee.vn/file/eec429a0d94f03ae15a821228e009c87"
];
const List<String> lNameProduct = [
  "Bộ Quần Áo Mưa Chống Thấm Nước Đi Xe Máy Dành Cho Nam Và Nữ",
  "Đồng hồ thông minh Samsung Galaxy Watch 5/ Watch 5",
  "Apple iPhone 14 Plus 512 GB - Hàng chính hãng",
  "[Galaxy S22 Ultra] Điện thoại Samsung Galaxy S22 Ultra - Hàng chính hãng",
  "[Galaxy Buds 2 Pro ] Tai nghe Samsung Galaxy Buds 2 Pro - Hàng chính hãng"
];
const List<String> lPriceProduct = [
  "152.000",
  "3.150.000",
  "30.000.000",
  "21.000.000",
  "2.500.000"
];
const List<String> lSaledProduct = ["125", "15", "25", "30", "10"];
const String saledName = "Đã bán ";
const Color yellowColor = Color(0xfffed813); //Yellow

const Color activeCyanColor = Color(0xff0a7c97);

const Color backgroundColor = Color(0xffebecee);

const List<Color> backgroundGradient = [
  Color(0xff80d9e9),
  Color(0xffa0e9ce),
]; //Cyan, and a mix of Cyan and Green

const List<Color> lightBackgroundaGradient = [
  Color(0xffa2e0eb),
  Color.fromARGB(255, 200, 228, 218),
];
const double kAppBarHeight = 80;
