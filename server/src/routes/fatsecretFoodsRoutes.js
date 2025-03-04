import { Router } from "express";

const router = Router();

router.get("/foods", getFoods);

export default router;
