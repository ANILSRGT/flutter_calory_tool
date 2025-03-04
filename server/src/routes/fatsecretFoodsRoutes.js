import { Router } from "express";
import FatsecretFoodsController from "../controllers/FatsecretFoodsController.js";

const router = Router();

router.get("/search", FatsecretFoodsController.search);

export default router;
