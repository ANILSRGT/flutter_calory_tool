import dotenv from "dotenv";
import express from "express";
import cors from "cors";
import swaggerUI from "swagger-ui-express";
import fs from "fs";
import { getAccessToken } from "./src/utils/fatsecretAccessToken.js";
import fatsecretFoodsRouter from "./src/routes/fatsecretFoodsRoutes.js";
import fatsecretRecipesRouter from "./src/routes/fatsecretRecipesRoutes.js";

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

// Swagger UI ayarları
const swaggerOptions = JSON.parse(fs.readFileSync("./swagger.json", "utf-8"));
app.use("/api-docs", swaggerUI.serve, swaggerUI.setup(swaggerOptions));

// CORS ayarları (güvenlik için sadece izin verilen origin'leri ekleyin)
app.use(cors({ origin: "*" }));
app.use(express.json());

// Fatsecret API'ye istek yapmak için gerekli olan anahtarlar
const fatsecretApiKey = getAccessToken();

// Routes
app.use("/api/v1/foods", fatsecretFoodsRouter);
app.use("/api/v1/recipes", fatsecretRecipesRouter);

// Start the server
app.listen(PORT, async () => {
  await fatsecretApiKey;
  console.log(`API Proxy sunucusu ${PORT} portunda çalışıyor...`);
});

export { fatsecretApiKey };
