import { post } from "axios";

const getAccessToken = async () => {
  const FATSECRET_CLIENT_ID = process.env.FATSECRET_CLIENT_ID;
  const FATSECRET_CLIENT_SECRET = process.env.FATSECRET_CLIENT_SECRET;
  const TOKEN_URL = "https://oauth.fatsecret.com/connect/token";

  try {
    const response = await post(
      TOKEN_URL,
      new URLSearchParams({
        grant_type: "client_credentials",
        scope: "basic",
      }),
      {
        headers: {
          Authorization: "Basic " + Buffer.from(`${FATSECRET_CLIENT_ID}:${FATSECRET_CLIENT_SECRET}`).toString("base64"),
          "Content-Type": "application/x-www-form-urlencoded",
        },
      }
    );

    const accessToken = response.data.access_token;
    return accessToken;
  } catch (error) {
    console.error("Token alma hatası:", error.response?.data || error.message);
    return null;
  }
};

export default { getAccessToken };
