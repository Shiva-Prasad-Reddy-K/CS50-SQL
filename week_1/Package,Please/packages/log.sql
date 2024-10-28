
-- *** The Lost Letter ***

    --To know the 'id' of the sender address--
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue';

    --Get the 'package_id' of the package from the packages table using the sender adress id
        SELECT "contenct" FROM "packages" WHERE "from_address_id" =(
            SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
        );

    --Get the 'address_id' from scans table for the 'package_id' and the action = Drop--
        SELECT "address_id" FROM "scans" WHERE "package_id" = (
                      SELECT "id" FROM "packages" WHERE "from_address_id" = (
                          SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
                      )
                      AND "contents" = 'Congratulatory letter'
                  )
                  AND "action" = 'Drop'

    --Get the address_type from the addresses table from the obtained address_id--
         SELECT "type" FROM "addresses" WHERE "id" = (
             SELECT "address_id" FROM "scans" WHERE "package_id" = (
                      SELECT "id" FROM "packages" WHERE "from_address_id" = (
                          SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
                      )
                      AND "contents" = 'Congratulatory letter'
                  )
                  AND "action" = 'Drop'
         );

-- *** The Devious Delivery ***

    --Get the packages ID from the packages table using the given hint "Rubber duck"--
        SELECT "id" FROM "packages" WHERE "contents" = 'duck%';
    --Get the scans details from the scans table about where the package is dropped--
        SELECT * FROM "scans" WHERE "package_id" = (
             SELECT "id" FROM "packages" WHERE "contents" = 'duck%'
         );
    --From the scan details get the address_ID of where did the package is dropped--
        SELECT "address_id" FROM "scans" WHERE "package_id" = (
             SELECT "id" FROM "packages" WHERE "contents" = 'duck%'
         )
         AND "action" = 'Drop';
    --Get the address_type of where did the product end up using the address_ID from the addresses table--
        SELECT "type" FROM "addresses" WHERE "id" = (
            SELECT "address_id" FROM "scans" WHERE "package_id" = (
                SELECT "ID" FROM "packages" WHERE "contents" LIKE 'duck%'
                ) AND "action" = 'Drop'
        );

-- *** The Forgotten Gift ***

    --Get the id of the address of the receiver and the sender
        --to_address ID--
            SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place';
        --from_address ID--
            SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place';
        --Get the contents and package_ID from the packages table using the to_address and _from_adderss IDs--
            SELECT "id" FROM "packages" WHERE "from_address_id" = 9873 AND "to_address_id" = 4983;
        --Get the address_ID of the address where the package is dropped from the scans table--
            SELECT * FROM "scans" WHERE "package_id" = (
                SELECT "id" FROM "packages" WHERE "from_address_id" = 9873 AND "to_address_id" = 4983
            );
        --As the driver has the package , Get the driver name using the driver ID from the scans table--
            SELECT "name" FROM "drivers" WHERE "id" = (
                SELECT "driver_id" FROM "scans" WHERE "package_id" = (
                    SELECT "id" FROM "packages" WHERE "from_address_id" = 9873 AND "to_address_id" = 4983
                ) AND "action" = 'Pick'
                ORDER BY "timestamp" DESC

            );


