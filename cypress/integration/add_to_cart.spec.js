it("Click on the add to cart button and increase the cart by 1", () => {
  cy.visit("http://localhost:3000/")
  cy.contains("My Cart (0)")
  cy.get(".products article").first()
  cy.contains("Add").click({force: true});
});