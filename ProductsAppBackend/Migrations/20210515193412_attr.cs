using Microsoft.EntityFrameworkCore.Migrations;

namespace ProductsAppBackend.Migrations
{
    public partial class attr : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Selected",
                table: "ProductProductAttributeValues",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Selected",
                table: "ProductProductAttributeValues");
        }
    }
}
