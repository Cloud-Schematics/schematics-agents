###############################################################################
# IBM Confidential
# OCO Source Materials
# IBM Cloud Schematics
# (C) Copyright IBM Corp. 2022 All Rights Reserved.
# The source code for this program is not  published or otherwise divested of
# its trade secrets, irrespective of what has been deposited with
# the U.S. Copyright Office.
###############################################################################

resource "kubernetes_network_policy" "deny_all_runtime" {
  metadata {
    name      = "deny-all-runtime"
    namespace = "schematics-runtime"
  }

  spec {
    pod_selector {
      match_expressions {
        key      = "app"
        operator = "In"
        values   = ["runtime-job"]
      }
    }

    policy_types = ["Egress", "Ingress"]
  }
  depends_on = [kubernetes_deployment.runtime_job]
}

