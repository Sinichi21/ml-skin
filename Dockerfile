# Gunakan image Node.js resmi
FROM node:18-alpine

# Set direktori kerja di dalam container
WORKDIR /usr/src/app

# Salin file `package.json` dan `package-lock.json`
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Salin seluruh file ke container
COPY . .

# Kompilasi TypeScript
RUN npm run build

# Expose port aplikasi (opsional, default port 8080)
EXPOSE 3000

# Perintah untuk menjalankan aplikasi
CMD ["node", "dist/index.js"]
