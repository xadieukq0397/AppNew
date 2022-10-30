import 'package:get/get.dart';
import 'package:responsive_login_ui/data/model/product.dart';
import 'package:responsive_login_ui/data/repository/product_repo.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isFilter = true;
  bool get isFilter => _isFilter;

  ProductController({required this.productRepo});

  Future<void> createProductToDB() async {
    List<Product>? listproducts = [
      Product(
        id: '1',
        name: "Bộ Quần Áo Mưa Chống Thấm Nước Đi Xe Máy Dành Cho Nam Và Nữ",
        image: "https://cf.shopee.vn/file/4d6ca89f6bf93fa3997357451f78f097_tn",
        decription: "Bộ đồ đen Chống mưa / có nắp đậy giày (nâng cấp)"
            "Black Green Suit Storm Proof / có nắp đậy giày (được nâng cấp)"
            "Black Grey Suit Storm Proof / Bọc giày (nâng cấp)"
            "Bộ đồ màu đen và đỏ chống bão / Nắp giày (được nâng cấp)"
            "Kích thước:"
            "M"
            "L"
            "Xl"
            "Xxl"
            "Xxxl",
        price: 152000,
        inventory: 125,
        weight: 1300,
      ),
      Product(
        id: '2',
        name: "Đồng hồ thông minh Samsung Galaxy Watch 5/ Watch 5",
        image: "https://cf.shopee.vn/file/77a05996c39ac02f7f4b3bd8441d098d",
        decription: "Chăm sóc từng giấc ngủ"
            "Thấu hiểu giấc ngủ với công nghệ mới nhất trên Galaxy Watch5. Dễ dàng lên kế hoạch ngủ, phát hiện tiếng ngáy, phân tích và theo dõi các giai đoạn giấc ngủ (thức, không sâu, ngủ say, REM) qua 8 linh vật đại diện cho giấc ngủ quả bạn. Hãy bắt đầu một ngày tuyệt vời hơn từ việc ngủ ngon hơn."
            "Theo nhịp trái tim"
            "Cảm biến sinh học Samsung BioActive"
            "Với cảm biến sinh học 3 trong 1: phân tích trở kháng điện sinh học (BIA), điện tim (ECG) và nhịp tim quang học (HR), cảm biến sinh học mạnh mẽ Samsung BioActive theo dõi sức khỏe của bạn hiệu quả và toàn diện hơn."
            "Theo nhịp bước chân"
            "Tập luyện thêm hiệu quả với tiến trình được cập nhật liên tục trên đồng hồ. Bạn có thể kiểm tra số bước chân, lượng calo và thậm chí là cả theo quen tập luyện được ghi lại đầy đủ trên Galaxy Watch5. Bên cạnh đó là hơn 90 bài tập cho bạn đa dạng trải nghiệm mỗi ngày."
            "Tức thì trở lại cuộc chơi"
            "Nạp nhanh tới 45% pin trong 30 phút sạc"
            "Sạc từ 0% đến 45% chỉ trong khoảng 30 phút. Đúng thế, bạn không đọc nhầm đâu. Với pin lớn hơn thế hệ tiền nhiệm và công suất sạc nhanh, Galaxy Watch5 luôn sẵn sàng giúp bạn quay lại cuộc chơi tức thì.",
        price: 3150000,
        inventory: 15,
        weight: 700,
      ),
      Product(
        id: '3',
        name: "Apple iPhone 14 Plus 512 GB - Hàng chính hãng",
        image: "https://cf.shopee.vn/file/0982de1d517eed28495a9bbcaced5881",
        decription:
            "iPhone 14 Plus. Nghĩ lớn cùng màn hình 6,7 inch lớn hơn1 và thời lượng pin bền bỉ cả ngày.2 Chụp những bức ảnh tuyệt đẹp trong điều kiện thiếu sáng và dư sáng cùng hệ thống camera kép mới. Phát Hiện Va Chạm,3 một tính năng an toàn mới, thay bạn gọi trợ giúp khi cần kíp. "
            "1Màn hình có các góc bo tròn. Khi tính theo hình chữ nhật chuẩn, kích thước màn hình theo đường chéo là 6,68 inch. Diện tích hiển thị thực tế nhỏ hơn."
            "2Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình; truy cập apple.com/batteries để biết thêm thông tin."
            "3SOS Khẩn Cấp sử dụng kết nối mạng di động hoặc Cuộc Gọi Wi-Fi."
            "4Cần có gói cước dữ liệu. Mạng 5G chỉ khả dụng ở một số thị trường và được cung cấp qua một số nhà mạng. Tốc độ có thể thay đổi tùy địa điểm và nhà mạng. Để biết thông tin về hỗ trợ mạng 5G, vui lòng liên hệ nhà mạng và truy cập apple.com/iphone/cellular."
            "5iPhone 14 Plus có khả năng chống tia nước, chống nước và chống bụi. Sản phẩm đã qua kiểm nghiệm trong điều kiện phòng thí nghiệm có kiểm soát đạt mức IP68 theo tiêu chuẩn IEC 60529 (chống nước ở độ sâu tối đa 6 mét trong vòng tối đa 30 phút). Khả năng chống tia nước, chống nước và chống bụi không phải là các điều kiện vĩnh viễn. Khả năng này có thể giảm do hao mòn thông thường. Không sạc pin khi iPhone đang bị ướt. Vui lòng tham khảo hướng dẫn sử dụng để biết cách lau sạch và làm khô máy. Không bảo hành sản phẩm bị hỏng do thấm chất lỏng."
            "6Một số tính năng không khả dụng tại một số quốc gia hoặc khu vực.",
        price: 30000000,
        inventory: 25,
        weight: 1200,
      ),
      Product(
        id: '4',
        name:
            "[Galaxy S22 Ultra] Điện thoại Samsung Galaxy S22 Ultra - Hàng chính hãng",
        image: "https://cf.shopee.vn/file/26635c69cd0f47fbd86150bbb8a43aa3",
        decription:
            "Samsung Galaxy S22 Ultra 256GB - chiếc điện thoại Galaxy S đầu tiên sở hữu bút S Pen trong thân máy, được cung cấp sức mạnh bởi CPU đến từ Qualcomm, sở hữu thiết kế sang trọng, màn hình có nhiều cải tiến cùng cụm camera zoom 100x. "
            "Thiết kế khác biệt hoàn toàn thế hệ trước"
            "Samsung Galaxy S22 Ultra 256GB ra mắt với một diện mạo “cũ mà mới”, máy sử dụng form thiết kế của dòng Galaxy Note trước đây để đưa vào dòng Galaxy S. Với hai cạnh trên và dưới vát phẳng, hai cạnh bên được bo cong mềm mại.",
        price: 21000000,
        inventory: 30,
        weight: 1000,
      ),
      Product(
        id: '5',
        name:
            "Tai nghe Samsung Galaxy S7 / s7edge và các dòng điện thoại cổng 3.5mm",
        image: "https://cf.shopee.vn/file/5613952b3e5db7682b2c235bb84692ee",
        decription:
            "Nổi bật với kiểu dáng thời trang và màu sắc tươi trẻ, tai nghe nhét tai Samsung là phụ kiện cá tính dành cho các tín đồ âm nhạc. Đặc biệt với dòng tai nghe cá tính này, bạn sẽ luôn cảm nhận âm nhạc một cách trọn vẹn. Tai nghe nhét tai Samsung tái hiện âm thanh trung thực, rõ ràng với âm bass trầm ấm, âm trung rõ ràng và âm cao chi tiết. Dù là với những giai điệu ballad trữ tình nhẹ nhàng hay bản rock sôi động, tai nghe nhét tai Samsung  luôn mang đến cho bạn những phút giây giải trí tuyệt vời. Không chỉ thế, tai nghe được trang bị chuẩn kết nối 3.5mm tương thích hoàn hảo với các thiết bị số phổ biến.",
        price: 89000,
        inventory: 10,
        weight: 500,
      ),
    ];
    if (listproducts.isNotEmpty) {
      await productRepo.createProductToDB(products: products);
      print("Create product to DB");
    }
  }

  Future<Product?> readProductByIdFromDB(String? id) async {
    Product? product = await productRepo.readProductByIDFromDB(id: id);
    if (product != null) {
      return product;
    } else {
      return null;
    }
  }

  Future<void> readAllProductFromDB() async {
    await createProductToDB();
    _isLoading = true;
    List<Product>? listProducts = await productRepo.readAllProductFromDB();
    _products = [];
    for (var product in listProducts!) {
      _products.add(product);
    }
    _isFilter = true;
    _isLoading = false;
    update();
  }

  Future<void> filterProduct(String value) async {
    _isLoading = true;
    _products = [];
    List<Product>? products = await productRepo.readAllProductFromDB();
    if (products!.isNotEmpty) {
      _products = products
          .where((Product product) =>
              product.name!.toLowerCase().startsWith(value.toLowerCase()))
          .toList();
    }
    _isFilter = false;
    _isLoading = false;
    update();
  }

  void removeProduct(int index) {
    _products.removeAt(index);
    update();
  }
}
