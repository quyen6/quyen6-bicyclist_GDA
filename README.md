# 🚴 Google Data Analytics Capstone - Cyclistic Bike-Share Case Study

## 📌 1. Giới thiệu & Bối cảnh (Introduction & Scenario)
Dự án này là **Case Study tốt nghiệp (Capstone Project)** thuộc khóa học **Google Data Analytics Certificate**. 

Trong dự án này, tôi đóng vai trò là một **Newbie Data Analyst** làm việc trong đội ngũ phân tích marketing của **Cyclistic** – một công ty chia sẻ xe đạp công cộng tại Chicago. 
* **Thực trạng:** Giám đốc Marketing (bà Lily Moreno) tin rằng sự thành công và tăng trưởng bền vững của công ty phụ thuộc vào việc tối đa hóa số lượng **Hội viên thường niên (Annual Members)**. 
* **Cơ hội:** Thay vì nhắm vào khách hàng hoàn toàn mới, chiến lược tối ưu nhất là chuyển đổi những **Khách hàng vãng lai (Casual Riders)** – những người đã biết và đang sử dụng dịch vụ của Cyclistic – thành Hội viên thường niên.
* **Nhiệm vụ cốt lõi:** Phân tích dữ liệu hành trình lịch sử của Cyclistic để làm rõ **sự khác biệt trong hành vi sử dụng xe giữa khách Casual và khách Member**, từ đó đề xuất chiến lược Marketing dựa trên dữ liệu giúp thúc đẩy chuyển đổi thành công.

---

## 🎯 2. Mục tiêu kinh doanh (Business Task)
* **Câu hỏi định hướng:** Khách hàng hội viên thường niên (Annual Members) và khách hàng vãng lai (Casual Riders) sử dụng xe đạp Cyclistic khác nhau như thế nào?
* **Mục tiêu cuối cùng:** Cung cấp các insights sâu sắc, có bằng chứng dữ liệu rõ ràng và trực quan hóa sinh động để thuyết phục Ban điều hành Cyclistic phê duyệt chiến lược Marketing chuyển đổi đối tượng Casual thành Member.

---

## 🛠️ 3. Quy trình Phân tích Dữ liệu (Data Analysis Process)


### 🗂️ Giai đoạn 1: Prepare (Chuẩn bị dữ liệu)
* **Nguồn dữ liệu:** Dữ liệu hành trình lịch sử thực tế của Cyclistic (được cung cấp bởi Motivate International Inc theo giấy phép mở).
* **Quy mô phân tích:** Sử dụng tập dữ liệu lớn của quý 1 ở 2 năm (2019 và 2020) với hơn **300.000+ dòng dữ liệu**.
* **Độ tin cậy:** Dữ liệu có tính định danh cao, không chứa thông tin cá nhân của khách hàng (bảo mật tuyệt đối), ghi nhận chi tiết thời gian bắt đầu/kết thúc, trạm đi/đến, và loại khách hàng.

### 🧹 Giai đoạn 2: Process (Xử lý & Làm sạch dữ liệu)
Do cấu trúc bảng dữ liệu giữa năm 2019 và 2020 có sự khác biệt về tên cột và kiểu dữ liệu, tôi đã sử dụng kết hợp **Python (Pandas)** và **SQL** để chuẩn hóa:
1. **Chuẩn hóa tên cột:** Đưa cấu trúc hai năm về cùng một định dạng chuẩn (ví dụ: `ride_id`, `started_at`, `ended_at`, `member_casual`).
2. **Gộp bảng dữ liệu (Data Merging):** Sử dụng hàm `pd.concat()` trong Python để hợp nhất dữ liệu 2 năm thành một DataFrame duy nhất mang tên `Data_Cleaned_Merged`.
3. **Kỹ nghệ tính toán chỉ số (Feature Engineering):**
   * Đưa cột `started_at` và `ended_at` về định dạng `datetime64`.
   * Tính toán độ dài chuyến đi (`ride_length` = `ended_at` - `started_at`) quy đổi ra **Số phút**.
   * Trích xuất thứ trong tuần (`day_of_week`) từ Thứ 2 đến Chủ Nhật để tìm kiếm xu hướng theo ngày.
4. **Xử lý lỗi định dạng & Loại bỏ nhiễu:**
   * Loại bỏ các chuyến đi lỗi hệ thống hoặc chạy thử nghiệm có `ride_length <= 0` phút.

### 📊 Giai đoạn 3: Analyze (Phân tích chỉ số cốt lõi)
Tôi tiến hành gom nhóm dữ liệu (`groupby`) theo `member_casual` và `year` để tìm ra các chỉ số thống kê mô tả quan trọng:
* **Tổng số chuyến đi (Total Rides):** Khách Member chiếm tỷ trọng áp đảo về tổng số lượng giao dịch, cho thấy tần suất sử dụng dịch vụ cực kỳ đều đặn.
* **Thời gian đi xe trung bình (Mean ride_length):** Phát hiện một nghịch lý thú vị: Khách Casual có thời gian đạp xe trung bình trên mỗi chuyến đi **dài gấp 2 đến 3 lần** so với khách Member.
* **Xu hướng theo ngày trong tuần (Day of the week trend):** Khách Member hoạt động mạnh mẽ và ổn định từ Thứ 2 đến Thứ 6. Ngược lại, lượng khách Casual bùng nổ mạnh mẽ vào hai ngày cuối tuần (Thứ 7 và Chủ Nhật).

---

## 📊 4. Kết quả & Trực quan hóa (Share & Insights)

Để giúp Ban điều hành có cái nhìn toàn diện, tôi đã xây dựng một **Interactive Tableau Dashboard** 

### 🖼️ Tableau Dashboard Interface

![Cyclistic Bike-Share Dashboard]<img width="1263" height="1033" alt="image" src="https://github.com/user-attachments/assets/47fe4fca-d0f9-484f-be9f-4337fd86834e" />

### 💡 Phát hiện cốt lõi từ dữ liệu (Key Insights):

| Đặc điểm | 🧑‍💼 Khách hàng Hội viên (Annual Member) | 🚴 Khách hàng Vãng lai (Casual Rider) |
| :--- | :--- | :--- |
| **Mục đích sử dụng** | **Di chuyển cố định (Commuters):** Đi làm hoặc đi học theo khung giờ cố định. | **Giải trí & Khám phá (Leisure):** Đi chơi, dạo phố, thư giãn hoặc du lịch. |
| **Tần suất theo ngày** | Cao điểm từ **Thứ 2 đến Thứ 6**, giảm dần vào cuối tuần. | Bùng nổ mạnh mẽ vào **Thứ 7 và Chủ Nhật**. |
| **Thời lượng hành trình** | Ngắn và nhanh (Trung bình từ **10 - 15 phút** một chuyến). | Kéo dài liên tục (Trung bình từ **25 - 45+ phút** một chuyến). |

---

## 🚀 5. Đề xuất Chiến lược Marketing (Act & Recommendations)

Dựa trên các bằng chứng dữ liệu rõ ràng ở trên, tôi đề xuất 3 chiến lược hành động cụ thể cho Giám đốc Marketing Lily Moreno:

1. **Gói hội viên cuối tuần (Weekend Membership):** * *Cơ sở dữ liệu:* Lượng khách Casual bùng nổ đột biến vào Thứ 7 và Chủ Nhật.
   * *Hành động:* Thiết kế và triển khai một gói sản phẩm thành viên chuyên biệt cho hai ngày cuối tuần với mức chi phí tối ưu. Gói này đóng vai trò như một "bước đệm" giúp Cyclistic giữ chân nhóm khách hàng giải trí mà không ép họ phải mua gói cả năm ngay lập tức.

2. **Truyền thông đánh vào nỗi đau chi phí:**
   * *Cơ sở dữ liệu:* Thời gian đi xe trung bình của khách Casual dài gấp 2 - 3 lần so với Member (từ 25 - 45+ phút). Nếu tính theo biểu phí trả theo lượt hiện tại, họ đang phải chi trả một số tiền rất lớn.
   * *Hành động:* Xây dựng các chiến dịch truyền thông cá nhân hóa (Email/Thông báo ứng dụng) gửi trực tiếp đến các tài khoản Casual thường xuyên đi chuyến dài với thông điệp tài chính rõ ràng: *"Bạn đã chi X đồng cho việc đạp xe tuần này. Nếu đổi sang thẻ Hội viên, bạn đã tiết kiệm được Y%!"*. Việc so sánh trực quan này sẽ kích thích động lực chuyển đổi nhờ đánh trúng "nỗi đau ví tiền" của họ.

3. **Định vị quảng cáo trọng điểm:**
   * *Cơ sở dữ liệu:* Khách Casual có khung giờ hoạt động tập trung rõ rệt (đạt đỉnh từ 15h - 17h chiều) và thường xuất hiện tại các địa điểm phục vụ mục đích giải trí.
   * *Hành động:* Tập trung toàn bộ ngân sách tiếp thị số (quảng cáo định vị, banner ứng dụng) vào đúng "khung giờ vàng" này. Đồng thời đặt các trạm thông tin quảng cáo vật lý mang tính kích thích thị giác tại các điểm nóng trọng điểm như khu vực công viên, điểm tham quan du lịch, hoặc dọc các bờ sông ở Chicago – nơi tập trung mật độ khách Casual cao nhất.

---

## 🛠️ Công cụ sử dụng trong dự án (Tech Stack)
* **Ngôn ngữ lập trình:** Python (Các thư viện: `Pandas` để xử lý dữ liệu lớn).
* **Truy vấn dữ liệu:** SQL.
* **Trực quan hóa dữ liệu:** Tableau (Thiết kế Storytelling Dashboard tương tác trực tiếp).

---

""
