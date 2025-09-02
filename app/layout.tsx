import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Intavio",
  description: "Building digital products & brands",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>
        {children}
      </body>
    </html>
  );
}
