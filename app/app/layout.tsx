"use client";
import "./style/globals.css";
import { Inter } from "next/font/google";
import { createConfig, mainnet, WagmiConfig } from "wagmi";
import { http, createPublicClient } from "viem";

const inter = Inter({ subsets: ["latin"] });

const config = createConfig({
  publicClient: createPublicClient({
    chain: mainnet,
    transport: http("127.0.0.1:8545"),
  }),
});

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <WagmiConfig config={config}>{children}</WagmiConfig>
      </body>
    </html>
  );
}
