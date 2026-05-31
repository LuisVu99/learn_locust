# Locust Load Testing Project

Project này sử dụng Locust để kiểm tra hiệu suất tải (Load Testing).

## 📋 Yêu cầu

- Python 3.9+
- pip

## 🚀 Cài đặt

```bash
# Cài đặt dependencies
pip install -r requirements.txt
```

## 🧪 Chạy Load Test Locally

### Chế độ Web UI (Mặc định)
```bash
locust -f locustfile.py --host=http://localhost:8000
```
Sau đó truy cập: http://localhost:8089

### Chế độ Headless (không có UI)
```bash
locust -f locustfile.py \
  --host=http://localhost:8000 \
  --users=10 \
  --spawn-rate=2 \
  --run-time=1m \
  --headless
```

## 📊 CI/CD Pipeline

Dự án này được tích hợp với **GitHub Actions** để tự động chạy load tests:

- **Trigger**: Push/PR vào branches `main` hoặc `develop`
- **Schedule**: Chạy hàng ngày (9 sáng, thứ 2-6)
- **Test**: Python 3.9, 3.10, 3.11
- **Artifacts**: Kết quả tests được lưu trữ 30 ngày

### Kết quả Test

Kết quả được upload trong phần **Artifacts** của workflow run.

## 📁 Cấu trúc Project

```
.
├── locustfile.py          # File định nghĩa load test scenarios
├── requirements.txt       # Python dependencies
├── .gitignore            # Git ignore rules
├── .github/
│   └── workflows/
│       └── load-test.yml  # GitHub Actions workflow
└── README.md             # File này
```

## 🔧 Tuỳ chỉnh

### Thay đổi URL target

Chỉnh sửa `--host` parameter trong lệnh hoặc trong `locustfile.py`:

```python
self.client.get("/booking/2")
```

### Thay đổi số users

Chỉnh sửa giá trị `--users` trong `.github/workflows/load-test.yml`:

```yaml
--users=10      # Thay 10 thành số lượng users mong muốn
```

## 📝 Ghi chú

- Hiện tại test đang target endpoint: `/booking/2`
- Chế độ CI/CD sử dụng `continue-on-error: true` để workflow không thất bại nếu target chưa sẵn sàng
- Kết quả được lưu ở định dạng CSV cho dễ phân tích

## 🤝 Đóng góp

1. Clone repo
2. Tạo feature branch
3. Commit changes
4. Push và tạo Pull Request

---

**Lần cập nhật gần nhất**: $(date)
