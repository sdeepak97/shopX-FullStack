import { join } from "path";
import { ConnectionOptions } from "typeorm";
import { CartEntity } from "./database/cart/entity/cart.entity";
import { ProductEntity } from "./database/products/entity/products.entity";
import { UserEntity } from "./database/user/entity/user.entity";
import { UserInfoEntity } from "./database/user_info/entity/userinfo.entity";
import dotenv from "dotenv";

dotenv.config();

const connectionOptions: ConnectionOptions = {

  url: process.env.DATABASE_URL,
  ssl: { rejectUnauthorized: false },
  type: "postgres",
  host: process.env.Host || "localhost",
  port: 5432,
  username: process.env.User || "postgres",
  password: process.env.DB_Password || "9848755758",
  database: process.env.Database || "postgres",
  entities: [UserEntity, CartEntity, UserInfoEntity, ProductEntity],
  synchronize: true,
  dropSchema: false,
  migrationsRun: true,
  logging: false,
  logger: "debug",
  migrations: [join(__dirname, "src/migration/**/*.ts")],
};

export = connectionOptions;
