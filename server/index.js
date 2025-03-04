import dotenv from "dotenv";
import express from "express";
import cors from "cors";
import { getAccessToken } from "./src/utils/fatsecretAccessToken.js";

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

// CORS ayarları (güvenlik için sadece izin verilen origin'leri ekleyin)
app.use(cors({ origin: "*" }));
app.use(express.json());

// Fatsecret API'ye istek yapmak için gerekli olan anahtarlar
const fatsecretApiKey = getAccessToken();

// Routes
app.get("/api", (req, res) => {
  res.send("API Proxy sunucusu çalışıyor...");
});

// Start the server
app.listen(PORT, async () => {
  await fatsecretApiKey;
  console.log(`API Proxy sunucusu ${PORT} portunda çalışıyor...`);
});

export { fatsecretApiKey };
