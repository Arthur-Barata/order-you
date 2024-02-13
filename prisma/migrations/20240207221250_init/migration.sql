-- CreateTable
CREATE TABLE "Eatery" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "email" STRING NOT NULL,
    "password" STRING NOT NULL,
    "cnpj" STRING,
    "logoImage" STRING,
    "marketingImage" STRING,
    "reatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "upDatedAt" TIMESTAMP(3) NOT NULL,
    "addressId" STRING NOT NULL,

    CONSTRAINT "Eatery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Items" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "image" STRING,
    "price" DECIMAL(65,30) NOT NULL,
    "isAvailable" BOOL NOT NULL DEFAULT true,
    "category" STRING NOT NULL,
    "eateryId" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "upDatedAt" TIMESTAMP(3) NOT NULL,
    "ordersId" STRING,

    CONSTRAINT "Items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkInformation" (
    "id" STRING NOT NULL,
    "isOpen" BOOL NOT NULL,
    "openHour" INT4 NOT NULL,
    "closeHour" INT4 NOT NULL,
    "deliveryTime" INT4 NOT NULL,
    "pickUpTime" INT4 NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "upDatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WorkInformation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Address" (
    "id" STRING NOT NULL,
    "number" STRING NOT NULL,
    "street" STRING NOT NULL,
    "neighborhood" STRING NOT NULL,
    "city" STRING NOT NULL,
    "state" STRING NOT NULL,
    "postalCode" STRING NOT NULL,
    "eateryId" STRING NOT NULL,

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Assessments" (
    "id" STRING NOT NULL,
    "rate" INT4 NOT NULL,
    "comment" STRING NOT NULL,
    "eateryId" STRING NOT NULL,

    CONSTRAINT "Assessments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Orders" (
    "id" STRING NOT NULL,
    "custumerName" STRING NOT NULL,
    "custumerNumber" STRING NOT NULL,
    "paymentMethod" STRING NOT NULL,
    "status" STRING NOT NULL,
    "obs" STRING NOT NULL,
    "isDelivery" BOOL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "usersId" STRING,

    CONSTRAINT "Orders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Users" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "email" STRING NOT NULL,
    "password" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ItemsOnOrdes" (
    "itemId" STRING NOT NULL,
    "orderId" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ItemsOnOrdes_pkey" PRIMARY KEY ("itemId","orderId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Eatery_email_key" ON "Eatery"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Address_eateryId_key" ON "Address"("eateryId");

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- AddForeignKey
ALTER TABLE "Items" ADD CONSTRAINT "Items_eateryId_fkey" FOREIGN KEY ("eateryId") REFERENCES "Eatery"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_eateryId_fkey" FOREIGN KEY ("eateryId") REFERENCES "Eatery"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Assessments" ADD CONSTRAINT "Assessments_eateryId_fkey" FOREIGN KEY ("eateryId") REFERENCES "Eatery"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ItemsOnOrdes" ADD CONSTRAINT "ItemsOnOrdes_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "Items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ItemsOnOrdes" ADD CONSTRAINT "ItemsOnOrdes_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
