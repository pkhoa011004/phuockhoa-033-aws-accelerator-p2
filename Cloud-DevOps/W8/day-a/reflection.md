# W8 Day 1 Reflection

## Chủ đề

Terraform Fundamentals – Infrastructure as Code (IaC)

## Terraform là gì?

Terraform là công cụ Infrastructure as Code (IaC) của HashiCorp, cho phép quản lý và triển khai hạ tầng bằng code thay vì thao tác thủ công trên giao diện web. Terraform sử dụng ngôn ngữ HCL (HashiCorp Configuration Language) để mô tả hạ tầng dưới dạng khai báo (Declarative).

## Hôm nay em đã học

### 1. Infrastructure as Code (IaC)

* Khái niệm quản lý hạ tầng bằng code.
* Lợi ích của IaC: tự động hóa, tái sử dụng, dễ kiểm soát bằng Git và giảm sai sót khi triển khai.

### 2. Terraform Workflow

* `terraform init`: Khởi tạo project và tải provider.
* `terraform validate`: Kiểm tra cú pháp và cấu hình.
* `terraform plan`: Xem trước những thay đổi Terraform sẽ thực hiện.
* `terraform apply`: Áp dụng thay đổi vào hạ tầng.
* `terraform destroy`: Xóa hạ tầng được Terraform quản lý.

### 3. Terraform State

* Hiểu vai trò của file `terraform.tfstate`.
* Terraform sử dụng State để theo dõi trạng thái thực tế của hạ tầng.
* State giúp Terraform xác định tài nguyên nào cần tạo mới, cập nhật hoặc xóa.

### 4. Các thành phần cơ bản của Terraform

* Provider: Cầu nối giữa Terraform và nền tảng như AWS.
* Resource: Thành phần hạ tầng được Terraform quản lý.
* Output: Giá trị đầu ra sau khi triển khai.
* Variables: Tham số đầu vào giúp cấu hình linh hoạt hơn.

## Điều em hiểu được

Sau buổi học hôm nay, em hiểu rằng Terraform không chỉ là công cụ tạo hạ tầng mà còn là công cụ quản lý vòng đời hạ tầng. Terraform giúp triển khai hạ tầng theo cách nhất quán, có thể tái sử dụng và dễ dàng cộng tác thông qua Git.

Em cũng hiểu tầm quan trọng của Terraform State vì đây là nguồn dữ liệu trung tâm giúp Terraform biết được trạng thái hiện tại của hệ thống và quyết định các thay đổi cần thực hiện.

## Khó khăn gặp phải

* Cài đặt Terraform trên Windows và cấu hình PATH.
* Hiểu cách Terraform sử dụng State để theo dõi hạ tầng.
* Làm quen với cú pháp HCL và workflow Terraform.

## Điều em cần tìm hiểu thêm

### Terraform Modules

* Cách tái sử dụng code Terraform.
* Thiết kế module theo chuẩn production.

### Remote State

* Lưu trữ State trên S3 hoặc HCP Terraform.
* Cơ chế khóa State (State Locking).

### Terraform Best Practices

* Cấu trúc thư mục dự án Terraform.
* Quản lý Variables và Secrets.
* Quy tắc đặt tên tài nguyên.

### Terraform trên AWS

* Tạo EC2, VPC, Security Group bằng Terraform.
* Quản lý hạ tầng AWS theo mô hình thực tế.

## Kết luận

Ngày đầu tiên giúp em hiểu được nền tảng của Terraform và Infrastructure as Code. Em đã thực hành thành công quy trình init → validate → plan → apply và hiểu được vai trò của State trong Terraform. Đây là nền tảng quan trọng để tiếp tục học Modules, State Management và triển khai hạ tầng AWS ở các buổi tiếp theo.
