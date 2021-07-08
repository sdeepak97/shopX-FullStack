import { join } from "path";
import { ConnectionOptions } from "typeorm";
import { CartEntity } from "./database/cart/entity/cart.entity";
import { ProductEntity } from "./database/products/entity/products.entity";
import { UserEntity } from "./database/user/entity/user.entity";
import { UserInfoEntity } from "./database/user_info/entity/userinfo.entity";

const connectionOptions: ConnectionOptions = {
  type: "postgres",
  host: "localhost",
  port: 5432,
  username: "postgres",
  password: "123456789",
  database: "postgres",
  entities: [UserEntity,CartEntity,UserInfoEntity,ProductEntity],
  synchronize: true,
  dropSchema: false,
  migrationsRun: true,
  logging: false,
  logger: "debug",
  migrations: [join(__dirname, "src/migration/**/*.ts")],
};

export = connectionOptions;
