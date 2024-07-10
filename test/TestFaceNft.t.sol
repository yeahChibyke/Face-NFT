// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >= 0.8.0;

import {Test, console2} from "forge-std/Test.sol";
import {FaceNft} from "../src/FaceNft.sol";

contract TestFaceNft is Test {
    FaceNft public faceNft;

    string public constant NERD_FACE_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODAwcHgiIGhlaWdodD0iODAwcHgiIHZpZXdCb3g9IjAgMCA2NCA2NCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgYXJpYS1oaWRkZW49InRydWUiIHJvbGU9ImltZyIgY2xhc3M9Imljb25pZnkgaWNvbmlmeS0tZW1vamlvbmUtbW9ub3RvbmUiIHByZXNlcnZlQXNwZWN0UmF0aW89InhNaWRZTWlkIG1lZXQiPjxwYXRoIGQ9Ik0zMiAyQzE1LjQzMiAyIDIgMTUuNDMyIDIgMzJzMTMuNDMyIDMwIDMwIDMwczMwLTEzLjQzMiAzMC0zMFM0OC41NjggMiAzMiAybTE4LjEwMyA5LjMyNGExNi40MTggMTYuNDE4IDAgMCAwLTguOTc5LS45MTVjLS43MDMuMTM1LS4xOTIgMi4yNy4zODggMi4xNTZjNC4xNjgtLjc0OCA4LjQ1Ni40IDExLjY5IDMuMTMzYy4xNjMuMTQyLjQ2OS4wMTUuNzY1LS4yMjJhMjcuNDkxIDI3LjQ5MSAwIDAgMSA0LjA2IDcuNjZDNTUuNzMgMTkuNDU2IDUxLjY1NyAxNyA0NyAxN2MtNC41MzMgMC04LjUyMSAyLjMyMy0xMC44NDggNS44NDJjLTIuNjg4LTEuMTY4LTUuODA1LTEuMDYxLTguMzAxLjAwN0MyNS41MjUgMTkuMzI2IDIxLjUzNyAxNyAxNyAxN2MtNC42NTcgMC04LjczIDIuNDU3LTExLjAyNiA2LjEzN2EyNy40NjggMjcuNDY4IDAgMCAxIDQuMTM2LTcuNzU4Yy4yNy4xOTcuNTM4LjI5OS42ODYuMTY5YTE0LjIzMyAxNC4yMzMgMCAwIDEgMTEuNjkyLTMuMTMzYy41OC4xMTMgMS4wOTItMi4wMjEuMzg5LTIuMTU2YTE2LjQxMSAxNi40MTEgMCAwIDAtOC42NzIuOEMxOS4wMDYgNi45NzMgMjUuMjE4IDQuNSAzMiA0LjVjNi45MjggMCAxMy4yNjIgMi41ODEgMTguMTAzIDYuODI0TTU3IDMwYzAgNS41MjEtNC40NzkgMTAtMTAgMTBzLTEwLTQuNDc5LTEwLTEwYzAtNS41MjQgNC40NzktMTAgMTAtMTBzMTAgNC40NzYgMTAgMTBtLTI5Ljk5OSAwYzAgNS41MjMtNC40NzkgMTAtMTAuMDAxIDEwYy01LjUyMiAwLTEwLTQuNDc3LTEwLTEwYzAtNS41MjQgNC40NzctMTAgMTAtMTBzMTAuMDAxIDQuNDc2IDEwLjAwMSAxME0zMiA1OS41Yy0xNC41NjMgMC0yNi41MTEtMTEuMzc5LTI3LjQzNi0yNS43MTJDNi4xODcgMzkuMTE5IDExLjEzOSA0MyAxNyA0M2M3LjE4IDAgMTMtNS44MiAxMy0xM2MwLTEuMjc2LS4xOTEtMi41MDYtLjUzNC0zLjY3MWMxLjUzLS40MzYgMy41NC0uNDM0IDUuMDY4LjAwMUExMi45NjQgMTIuOTY0IDAgMCAwIDM0IDMwYzAgNy4xOCA1LjgyIDEzIDEzIDEzYzUuODYxIDAgMTAuODEzLTMuODgxIDEyLjQzNi05LjIxMkM1OC41MTEgNDguMTIxIDQ2LjU2MyA1OS41IDMyIDU5LjUiIGZpbGw9IiMwMDAwMDAiPjwvcGF0aD48ZWxsaXBzZSBjeD0iMjAiIGN5PSIzMC41IiByeD0iNCIgcnk9IjUiIGZpbGw9IiMwMDAwMDAiPjwvZWxsaXBzZT48ZWxsaXBzZSBjeD0iNDQiIGN5PSIzMC41IiByeD0iNCIgcnk9IjUiIGZpbGw9IiMwMDAwMDAiPjwvZWxsaXBzZT48cGF0aCBkPSJNNDEuNDA0IDQ1LjE1Yy0zLjIyMyAyLjI2OS04LjM1MyAzLjgzNC0xMy42NiAyLjQzM2MtMS40MjEtLjM3Ny0yLjUzNSAzLjMxLTEuMDE4IDMuNzMzYzUuNzY3IDEuNTUgMTIuMDQ5LjQyOSAxNi45My0zLjAxNGMxLjIwNS0uODY4LTEuMDU0LTQuMDI3LTIuMjUyLTMuMTUyIiBmaWxsPSIjMDAwMDAwIj48L3BhdGg+PC9zdmc+";
    string public constant NINJA_FACE_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODAwcHgiIGhlaWdodD0iODAwcHgiIHZpZXdCb3g9IjAgMCA1MTIgNTEyIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGZpbGw9IiMwMDAwMDAiIGQ9Ik0yODAuMDU0IDE5Ljg2N2MtNjQuMzE1IDAtMTIxLjc2IDI4Ljc5My0xNTkuNjQzIDczLjkzNCAyNy4zODcuMDcgODcuOTI4IDMuMDUgOTYuMTIgMjUuNzI2LTM4LjQxNC0xMi4xMDUtNzkuNzUzLTExLjI2LTEwOC41MzQtOS4zMDJhMjAxLjAxMyAyMDEuMDEzIDAgMCAwLTEzLjY1NiAyMy4zMTRjMzEuNTA3LTguMzA3IDE0Ny45OTgtMy4zNyAxNTQuOCAyMS4yNjgtNzUuOTg1LTE4LjYyNC0xNDAuNTktOC42NS0xNjIuMDU4LTQuODk1LTguNzY4IDIyLjQ0Ni0xMy41ODQgNDYuODA1LTEzLjU4NCA3Mi4yNzIgMCAxMTEuNzM2IDk2LjI0OCAyNjkuOTQ5IDIxMC4zMjQgMjY5Ljk0OSA1Ny44MDggMCAxMDkuMS00MC42MyAxNDUuNjM3LTk1LjI0OC0zMS40MDMgMjMuODEyLTk4LjA0IDU3LjMwOC0xMzkuMDAyIDM0LjY0OCA4MS41OTItOC45OTQgMTM5Ljk2NS01MC45NzggMTU2LjE5LTYzLjM1MyAyNS4yMDctNDcuMTQyIDM5Ljk1OS0xMDAuNDMyIDM5Ljk1OS0xNDUuOTk2IDAtMTExLjczNy05Mi40NzctMjAyLjMxNy0yMDYuNTUzLTIwMi4zMTd6bS0uMDAyIDE1MS42OTJjMTA1LjA4NCAwIDE5MC4yNzMgMjcuNzI3IDE5MC4yNzMgNjEuOTMxIDAgMjIuMDQ3LTQuNDk1IDMzLjQ4LTU3Ljc5NyA0NC40NTMtMjkuMzkgNi4wNTItOTUuMTI3LTMxLjE4MS0xMzIuNDc2LTMxLjE4MS0zNC44NjQgMC04Ny4xMiA0MS4zNDUtMTE1LjIxOSAzNi4wMTctNTYuNTk3LTEwLjczMi03NS4wNTMtMjYuNDMzLTc1LjA1My00OS4yODkgMC0zNC4yMDQgODUuMTg4LTYxLjkzMSAxOTAuMjcyLTYxLjkzMXptODMuODg1IDM5Ljg5NGMtMjAuMTQtLjEyLTQxLjU3MSAzLjI5NS00MS40NzUgOS45MS4xODIgMTIuNDUzIDE3LjM2NCAyMi4yOTggMzguMzc3IDIxLjk5IDIxLjAxMy0uMzA2IDE4LjU1NS0xNi4yMTYgMzcuNzE3LTIzLjEwMS0uMDg1LTUuODM3LTE2Ljg1LTguNjkzLTM0LjYyLTguNzk5em0tMTcyLjY4MiAyLjg4M2MtMTcuNzcuMTA1LTM0LjUzNCAyLjk2NC0zNC42MiA4LjggMTkuMTYyIDYuODg1IDE2LjcwNCAyMi43OTYgMzcuNzE4IDIzLjEwMiAyMS4wMTMuMzA3IDM4LjE5NS05LjU0IDM4LjM3Ny0yMS45OTIuMDk2LTYuNjE1LTIxLjMzNi0xMC4wMy00MS40NzUtOS45MXptOTIuNTcgODIuNDQxYzMxLjAzMiAwIDU2LjE4OCAyNS4yMzUgNTYuMTg4IDI1LjIzNXMtMjguMTg0LTExLjEwNC01OS4yMTctMTEuMTA0Yy0zMS4wMzIgMC01My4xNiAxMS4xMDQtNTMuMTYgMTEuMTA0czI1LjE1Ni0yNS4yMzUgNTYuMTktMjUuMjM1ek0zMS4yNSA0MTEuMzljNC4zNDQgMi4wNDYgNy43ODMtNDAuMzM2IDUyLjI0Ni02MS4yNjUtOC4xMTEtOC40NjUtMTIuNDM4LTI0LjYzOC0xNC4yNC0zNS41MDItMzIuNzMzIDQuMTU4LTU1LjAxMiA4NC44ODctMzguMDA2IDk2Ljc2N3ptNTYuMzEtNDEuNjk0Yy03LjUxMS0uMDUyLTE3LjI2LS4yMjgtMTcuNDQ1IDE2LjkzNy0uNDk4IDQ2LjMxLTQyLjgwNSA5Ni45NTMtNDAuMTI4IDk4LjIxNSA3LjEzOCAzLjM2NCA0OS41OTgtMzIuMDc3IDYxLjkwNi01OS40NCA0LjE1OS05LjI0NCAxMS41MTYtNTUuNjAzLTQuMzMzLTU1LjcxMnoiLz48L3N2Zz4=";
    string public constant SMILE_FACE_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjgwMHB4IiB3aWR0aD0iODAwcHgiIHZlcnNpb249IjEuMSIgaWQ9IkNhcGFfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgDQoJIHZpZXdCb3g9IjAgMCA0NTIuOTg2IDQ1Mi45ODYiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGc+DQoJCTxnPg0KCQkJPHBhdGggc3R5bGU9ImZpbGw6IzAxMDAwMjsiIGQ9Ik0yMjYuNDkzLDBDMTAxLjU3NywwLDAsMTAxLjU3NywwLDIyNi40OTNjMCwxMjQuODczLDEwMS41NzcsMjI2LjQ5MywyMjYuNDkzLDIyNi40OTMNCgkJCQljMTI0Ljg1MiwwLDIyNi40OTMtMTAxLjYyLDIyNi40OTMtMjI2LjQ5M0M0NTIuOTg2LDEwMS41NzcsMzUxLjM0NSwwLDIyNi40OTMsMHogTTIyNi40OTMsNDI3Ljc5Mg0KCQkJCWMtMTExLjA0NiwwLTIwMS4zMi05MC4yOTUtMjAxLjMyLTIwMS4yOTljMC0xMTEuMDI1LDkwLjI3NC0yMDEuMzQyLDIwMS4zMi0yMDEuMzQyYzExMC45ODIsMCwyMDEuMjc3LDkwLjMxNywyMDEuMjc3LDIwMS4zNDINCgkJCQlDNDI3Ljc3LDMzNy40OTYsMzM3LjQ3NSw0MjcuNzkyLDIyNi40OTMsNDI3Ljc5MnoiLz4NCgkJCTxwYXRoIHN0eWxlPSJmaWxsOiMwMTAwMDI7IiBkPSJNMTQ3LjI4NSwyMjIuNTAzYzE2LjgyNSwwLDMwLjQ1OC0xMy41NDYsMzAuNDU4LTMwLjM1YzAtMTYuODA0LTEzLjYzMy0zMC4zOTMtMzAuNDU4LTMwLjM5Mw0KCQkJCWMtMTYuNzE3LDAtMzAuMzkzLDEzLjU5LTMwLjM5MywzMC4zOTNTMTMwLjU2OCwyMjIuNTAzLDE0Ny4yODUsMjIyLjUwM3oiLz4NCgkJCTxjaXJjbGUgc3R5bGU9ImZpbGw6IzAxMDAwMjsiIGN4PSIzMDUuNjM2IiBjeT0iMTkyLjEzMSIgcj0iMzAuMzcyIi8+DQoJCQk8cGF0aCBzdHlsZT0iZmlsbDojMDEwMDAyOyIgZD0iTTIyNi40OTMsMzc1LjY1NWM2MC4zOTgsMCwxMTIuMDE3LTM2LjA4OCwxMzUuNTA4LTg3Ljc3Mkg5MS4wMDcNCgkJCQlDMTE0LjQxMSwzMzkuNTY3LDE2Ni4wMywzNzUuNjU1LDIyNi40OTMsMzc1LjY1NXoiLz4NCgkJPC9nPg0KCTwvZz4NCgk8Zz4NCgk8L2c+DQoJPGc+DQoJPC9nPg0KCTxnPg0KCTwvZz4NCgk8Zz4NCgk8L2c+DQoJPGc+DQoJPC9nPg0KCTxnPg0KCTwvZz4NCgk8Zz4NCgk8L2c+DQoJPGc+DQoJPC9nPg0KCTxnPg0KCTwvZz4NCgk8Zz4NCgk8L2c+DQoJPGc+DQoJPC9nPg0KCTxnPg0KCTwvZz4NCgk8Zz4NCgk8L2c+DQoJPGc+DQoJPC9nPg0KCTxnPg0KCTwvZz4NCjwvZz4NCjwvc3ZnPg==";

    address Chibyke = makeAddr("Chibyke");

    function setUp() public {
        faceNft = new FaceNft(NERD_FACE_SVG_URI, NINJA_FACE_SVG_URI, SMILE_FACE_SVG_URI);
    }

    function testCanViewTokenURI() public {
        vm.prank(Chibyke);

        faceNft.mintNft();

        console2.log(faceNft.tokenURI(0));
    }
}
