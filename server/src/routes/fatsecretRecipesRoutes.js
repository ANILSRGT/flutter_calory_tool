import { Router } from "express";

const router = Router();

router.get("/recipes", getFoods);

export default router;
