using Microsoft.EntityFrameworkCore.Migrations;

namespace ProductsAppBackend.Migrations
{
    public partial class atribs : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ProductProductAttributeValues_Products_ProductId",
                table: "ProductProductAttributeValues");

            migrationBuilder.DropPrimaryKey(
                name: "PK_ProductProductAttributeValues",
                table: "ProductProductAttributeValues");

            migrationBuilder.AddColumn<int>(
                name: "Id",
                table: "ProductProductAttributeValues",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_ProductProductAttributeValues",
                table: "ProductProductAttributeValues",
                column: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_ProductProductAttributeValues",
                table: "ProductProductAttributeValues");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "ProductProductAttributeValues");

            migrationBuilder.AddPrimaryKey(
                name: "PK_ProductProductAttributeValues",
                table: "ProductProductAttributeValues",
                columns: new[] { "ProductId", "ProductAttributeValueId" });

            migrationBuilder.AddForeignKey(
                name: "FK_ProductProductAttributeValues_Products_ProductId",
                table: "ProductProductAttributeValues",
                column: "ProductId",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
