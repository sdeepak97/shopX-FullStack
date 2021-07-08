import Router from "express";
import { AuthenticationController } from "../controllers/authentication.controller";
import { CartController } from "../controllers/cart.controller";

const cartrouter = Router();

//! @GET
cartrouter.get("/:useremail", CartController.getCartProducts);

//! @POST
cartrouter.post("/add-to-cart", CartController.addToCart);

//! @DELETE
cartrouter.delete("/delete/:productId", CartController.deleteCartData);

export { cartrouter };
