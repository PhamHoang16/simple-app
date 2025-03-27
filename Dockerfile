# Chọn base image phù hợp với kiến trúc amd64 để tránh lỗi "exec format error"
FROM node:16-bullseye

# Tạo thư mục ứng dụng và đặt nó làm thư mục làm việc
WORKDIR /app

# Copy package.json và package-lock.json trước để tận dụng Docker cache
COPY package*.json /app/

# Cài đặt dependencies
RUN npm install

# Copy toàn bộ mã nguồn vào container
COPY . .

# Mở port 8080 để chạy ứng dụng
EXPOSE 8080

# Chạy ứng dụng
CMD ["npm", "start"]
