import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv("hospital_cleaned.csv")

df["LOS"] = (
    pd.to_datetime(df["DischargeDate"]) -
    pd.to_datetime(df["AdmissionDate"])
).dt.days

billing_column = "TotalBilling" if "TotalBilling" in df.columns else "TotalCharges"

correlation_data = df[["Age", "LOS", billing_column]].corr()

print("Correlation Matrix:")
print(correlation_data)

plt.figure(figsize=(6, 5))
sns.heatmap(correlation_data, annot=True, cmap="coolwarm", fmt=".2f")
plt.title("Correlation Matrix of Age, LOS, and Total Billing")
plt.tight_layout()
plt.show()

if "PatientSatisfaction" in df.columns:
    satisfaction_corr = df[["PatientSatisfaction", "LOS"]].corr()

    print("\nPatient Satisfaction vs LOS Correlation:")
    print(satisfaction_corr)

    plt.figure(figsize=(6, 5))
    sns.scatterplot(data=df, x="LOS", y="PatientSatisfaction")
    plt.title("Patient Satisfaction vs Length of Stay")
    plt.xlabel("Length of Stay (Days)")
    plt.ylabel("Patient Satisfaction")
    plt.tight_layout()
    plt.show()
else:
    print("\nPatientSatisfaction column not found. Analysis skipped.")