library(ggdag)
theme_set(theme_dag())

bullwhip_dag <- dagify(manufacturer ~ distributor,
                       distributor ~ wholesaler,
                       wholesaler ~ retailer,
                       retailer ~ consumer,
                       labels = c("manufacturer" = "Manufacturer",
                                  "distributor" = "Distributor",
                                  "wholesaler" = "Wholesaler",
                                  "retailer" = "Retailer",
                                  "consumer" = "Consumer"),
                       latent = "consumer",
                       exposure = c("retailer", "wholesaler", "distributor"),
                       outcome = "manufacturer")

ggdag(bullwhip_dag, text = FALSE, use_labels = "label")