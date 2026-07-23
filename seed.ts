import bcrypt from "bcrypt";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  const passwordHash = await bcrypt.hash("123456", 10);
  await prisma.user.upsert({
    where: { email: "admin@test.com" },
    update: {
      name: "Admin User",
      password: passwordHash,
      updated_at: new Date(),
    },
    create: {
      name: "Admin User",
      email: "admin@test.com",
      password: passwordHash,
    },
  });
}

main()
  .catch((error) => {
    // eslint-disable-next-line no-console
    console.error(error);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
